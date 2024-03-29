require 'spec_helper'

describe Program do
  it { should belong_to :kit }
  it { should belong_to :current_step }
  it { should belong_to :user }
  it { should validate_presence_of :kit }
  it { should have_many :snapshots }

  it "should have a factory" do
    create(:program).should be_valid
  end

  describe "scopes" do
    it "should have a featured scope" do
      unfeatured = create(:program)
      featured = create(:program, featured: true)
      Program.featured.should include(featured)
    end
  end

  describe "creation" do
    it "should start on the first step" do
      step = create(:step)
      p = create(:program, kit: step.kit)
      p.current_step.should == step
    end
  end

  describe "after_save" do
    it "should create a snapshot" do
      step1 = create(:step, position: 1)
      step2 = create(:step, position: 2, kit: step1.kit)
      program = create(:program, kit: step1.kit)
      snapshot = Snapshot.last
      snapshot.program.should == program
      snapshot.step.should == step1
      program.reload.update_attributes(step_id: step2.id, code: 'bar')
      snapshot2 = Snapshot.last
      snapshot2.step.should == step2
      snapshot2.code.should == 'bar'
    end
  end

  describe "before_save" do
    it "should return the kit name if it doesn't exists" do
      kit = Kit.create!(slug: "foo", name: 'bar')
      program = Program.create!(kit: kit)
      program.name.should == "bar"
      program.update_attributes(name: "boo!")
      program.name.should == "boo!"
    end
  end

  describe "#user_name" do
    context "there is a user" do
      it "should return the users name" do
        program = create(:program)
        program.user_name.should == program.user.name
      end
    end
    context "there is not a user" do
      it "should return anonymous" do
        program = create(:program, user: nil)
        program.user_name.should == "anonymous"
      end
    end
  end

  describe "#next_step" do
    it "should return the next step" do
      step = create(:step, position: 1)
      next_step = create(:step, kit: step.kit, position: 2)
      program = create(:program, kit: step.kit)
      program.next_step.should == next_step
    end
  end

  describe "#previous_step" do
    it "should return the previous step" do
      step3 = create(:step, position: 3)
      step2 = create(:step, kit: step3.kit, position: 2)
      step1 = create(:step, kit: step3.kit, position: 1)
      program = create(:program, kit: step3.kit)
      program.update_attributes(current_step: step3)
      program.previous_step.should == step2
    end
  end

end
