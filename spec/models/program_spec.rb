require 'spec_helper'

describe Program do
  it { should belong_to :kit }
  it { should belong_to :current_step }
  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should have_many :snapshots }

  it "should have a factory" do
    create(:program).should be_valid
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
    it "should return the user name if it doesn't exists" do
      kit = Kit.create!(slug: "foo", name: 'bar')
      user = User.create!(name: "foo")
      program = Program.create!(kit: kit, user: user)
      program.name.should == "foo's bar"
      program.update_attributes(name: "boo!")
      program.name.should == "boo!"
    end
  end

  describe "#next_step" do
    it "should return the next step" do
      step = create(:step)
      next_step = create(:step, kit: step.kit)
      p = create(:program, kit: step.kit)
      p.next_step.should == next_step
    end
  end

end
