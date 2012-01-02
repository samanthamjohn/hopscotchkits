require 'spec_helper'

describe User do

  it { User.create!(name: "Evan"); should validate_uniqueness_of :slug }
  describe "create" do
    it "should save the slug based on name" do
      u = User.create!(name: "Test")
      u.slug.should == "test"
    end

    xit "should increment the slug if the name is already in use" do

    end
  end
end
