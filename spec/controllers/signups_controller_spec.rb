require 'spec_helper'
describe SignupsController do
  it "should create a new signup" do
    post :create, signup: {source: "homepage", email: "foo@bar.com"}
    Signup.last.email.should == "foo@bar.com"
    response.should redirect_to root_path

  end

end
