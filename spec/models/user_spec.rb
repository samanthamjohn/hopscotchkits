require 'spec_helper'

describe User do

  it { create(:user); should validate_uniqueness_of :slug }
  it { should have_many :programs}

  it "should have a factory" do
    create(:user).should be_valid
  end

  describe "before_create" do
    it "should save the slug based on name" do
      u = create(:user, name: 'test')
      u.slug.should == "test"
    end

    it "should increment the slug if the name is already in use" do
      user1 = create(:user, name: "Test")
      user2 = create(:user, name: "Test")
      user1.slug.should_not == user2.slug
    end
  end
end
