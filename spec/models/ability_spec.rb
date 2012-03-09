require 'spec_helper'
require "cancan/matchers"

describe Ability do
  context "admin" do
    it "should be able to manage all" do
      user = create(:user, role: "admin")
      ability = Ability.new(user)
      ability.should be_able_to(:manage, :all)
    end
  end
end
