require 'spec_helper'

describe Program do
  it { should belong_to :kit }
  it { should belong_to :current_step }
  it { should belong_to :user }
  it { should validate_presence_of :user }

  describe "creation" do
    it "should start on the first step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      user = User.create!(name: "foo")
      p = Program.create!(kit: kit, user: user)
      p.current_step.should == step
    end
  end

  describe "after_save" do
    it "should create a snapshot" do
      kit = Kit.create!(slug: "foo")
      step1 = Step.create!(position: 1, kit: kit)
      step2 = Step.create!(position: 2, kit: kit)
      user = User.create!(name: 'foo')
      program = Program.create(kit: kit, user: user)
      snapshot = Snapshot.last
      snapshot.program.should == program
      snapshot.step.should == step1
      step2_id = step2.id
      program.reload.update_attributes(step_id: step2_id, code: 'bar')
      snapshot2 = Snapshot.last
      snapshot2.step.should == step2
      snapshot2.code.should == 'bar'
    end
  end

  describe "#next_step" do
    it "should return the next step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      next_step = Step.create!(position: 5, kit: kit)
      user = User.create!(name: "foo")
      p = Program.create!(kit: kit, user: user)
      p.next_step.should == next_step
    end
  end

end
