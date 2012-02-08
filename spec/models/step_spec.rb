require 'spec_helper'

describe Step do
  it { should belong_to :kit }

  it "should be unique across kit and position" do
    kit = Kit.create!(slug: 'foo')
    step1 = Step.create!(kit: kit, position: 1)
    step1.should be_valid

    step2 = Step.new(kit: kit, position: 1)
    step2.should_not be_valid

    step3 = Step.new(kit: kit, position: 2)
    step3.should be_valid
  end

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

  describe "to_json" do
    it "should return the step attributes plus last_step and next_step" do
      kit = Kit.create!(slug: "foo")
      step1 = Step.create!(position: 1, kit: kit, description: "hello\nfoo")
      step2 = Step.create!(position: 2, kit: kit)
      step1_json = JSON.parse(step1.to_json)
      step1_json["next_step_id"].should == step2.id
      step1_json["last_step"].should_not be
      step1_json["kit_id"].should == step1.kit.id
      step1_json["description"].should == "<p>hello\n<br />foo</p>"

      step2_json = JSON.parse(step2.to_json)
      step2_json["next_step_id"].should be_nil
      step2_json["last_step"].should be_true
    end
  end
end
