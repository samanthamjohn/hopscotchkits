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

  describe "#last_step?" do
    it "should return true if there are no more next steps without a flag" do
      kit = Kit.create!(slug: "foo")
      step1 = Step.create!(position: 1, kit: kit)
      step2 = Step.create!(position: 2, kit: kit)
      step3_bonus = Step.create!(position: 3, kit: kit, bonus: true)
      step4_freeplay = Step.create!(position: 4, kit: kit, freeplay: true)
      step1.last_step?.should == false
      step2.last_step?.should == true
      step3_bonus.last_step?.should == false
      step4_freeplay.last_step?.should == false
    end

  end
end
