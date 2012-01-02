require 'spec_helper'
describe SignupsController do
  it "should create a new signup" do
    post :create, signup: {source: "homepage", email: "foo@bar.com"}
    Signup.last.email.should == "foo@bar.com"
    response.should redirect_to root_path
    flash[:notice].should == "Thanks for signing up for our mailing list. We'll be in touch soon!"

  end

end
