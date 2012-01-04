require 'spec_helper'

describe UsersController do

  describe "#login" do
    it "should login the user with the given token" do
      user  = User.create(name: "Samantha", token: "123")
      get :login, token: "123"
      controller.session[:user_id].should == user.id
      response.should redirect_to kits_path
    end
  end

end
