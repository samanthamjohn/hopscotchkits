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

end
