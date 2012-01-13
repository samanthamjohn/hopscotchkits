require 'spec_helper'

describe Kit do
  it { Kit.create(slug: "foo"); should validate_uniqueness_of :slug}
  it { should validate_presence_of :slug}
  it { should have_many :steps}

  describe ".published" do
    it "should only include kits where published= true" do
      published_kit = Kit.create!(slug: "foo", published: true)
      unpublished_kit = Kit.create!(slug: "bar", published: false)
      Kit.published.should include(published_kit)
      Kit.published.should_not include(unpublished_kit)
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

end
