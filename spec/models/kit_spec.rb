require 'spec_helper'

describe Kit do
  it { Kit.create(slug: "foo"); should validate_uniqueness_of :slug}
  it { should validate_presence_of :slug}
end
