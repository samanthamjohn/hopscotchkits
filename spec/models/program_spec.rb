require 'spec_helper'

describe Program do
  it { should belong_to :kit }
  it { should belong_to :current_step }

  describe "creation" do
    it "should start on the first step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      p = Program.create!(kit: kit)
      p.current_step.should == step
    end
  end

  describe "#next_step" do
    it "should return the next step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      next_step = Step.create!(position: 5, kit: kit)
      p = Program.create!(kit: kit)
      p.next_step.should == next_step
    end
  end
end
