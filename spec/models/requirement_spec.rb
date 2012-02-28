require 'spec_helper'

describe Requirement do
  it { should validate_presence_of :name }
  it { should validate_presence_of :spec }
  it { should validate_presence_of :message }
  it { should belong_to :step }

  it "should have a factory" do
    build(:requirement).should be_valid
  end
end
