require 'spec_helper'

describe Step do
  it { should belong_to :kit }

  describe "#next_step" do
    it "should return the next step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      next_step = Step.create!(position: 5, kit: kit)
      step.next_step.should == next_step
    end
  end
end
