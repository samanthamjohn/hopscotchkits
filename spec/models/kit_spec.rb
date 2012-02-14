require 'spec_helper'

describe Kit do
  it { Kit.create(slug: "foo"); should validate_uniqueness_of :slug}
  it { should validate_presence_of :slug}
  it { should have_many :steps}
  it { should have_many :programs}

  it "should have a factory" do
    create(:kit).should be_valid
  end
  describe ".published" do
    it "should only include kits where published= true" do
      published_kit = Kit.create!(slug: "foo", published: true)
      unpublished_kit = Kit.create!(slug: "bar", published: false)
      Kit.published.should include(published_kit)
      Kit.published.should_not include(unpublished_kit)
    end
  end

  describe "step" do
    it "should return the step_id at the position specified" do
      kit = Kit.create!(slug: 'foo')
      step = Step.create!(kit: kit, position: 1)
      kit.step(1).should == step.id
    end

    it "should return nil if nothing is found" do
      kit = Kit.create!(slug: 'foo')
      step = Step.create!(kit: kit, position: 1)
      step1 = Step.create!(kit: kit, position: 2)
      kit.step(3).should == nil
    end
  end

  describe "#num_steps" do
    it "should return the number of non-bonus, non-freeplay steps" do
      kit = Kit.create!(slug: "foo")
      step1 = Step.create!(position: 1, kit: kit)
      step3_bonus = Step.create!(position: 3, kit: kit, bonus: true)
      step4_freeplay = Step.create!(position: 4, kit: kit, freeplay: true)
      kit.num_steps.should == 1
    end
  end

  describe "#freeplay_step" do
    it "should return the freeplay step" do
      kit = Kit.create!(slug: "foo")
      freeplay = Step.create!(position: 4, kit: kit, freeplay: true)
      kit.freeplay_step.should == freeplay
    end

  end

  describe "#has_freeplay?" do
    let!(:kit) { Kit.create!(slug: "foo") }
    context "there are no freeplay steps" do
      it "should return false" do
        kit.has_freeplay?.should == false
      end
    end
    context "there are freeplay steps" do
      before do
        Step.create!(position: 3, kit: kit, freeplay: true)
      end
      it "should return true" do
        kit.has_freeplay?.should == true
      end
    end
  end

  describe "#bonus" do
    it "should return the first bonus step" do
      kit = Kit.create!(slug: 'foo')
      bonus_2 = Step.create!(position: 2, kit: kit, bonus: true)
      bonus = Step.create!(position: 1, kit: kit, bonus: true)
      kit.bonus.should == bonus.position
    end
  end

  describe "#has_bonus?" do
    let!(:kit) { Kit.create!(slug: "foo") }
    context "there are no bonus steps" do
      it "should return false" do
        kit.has_bonus?.should == false
      end
    end
    context "there are freeplay steps" do
      before do
        Step.create!(position: 3, kit: kit, bonus: true)
      end
      it "should return true" do
        kit.has_bonus?.should == true
      end
    end
  end
end
