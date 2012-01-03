require 'spec_helper'
describe SignupsController do
  context "when the source is the homepage" do
    it "should create a new signup and redirect to homepage" do
      post :create, signup: {source: "homepage", email: "foo@bar.com"}
      Signup.last.email.should == "foo@bar.com"
      response.should redirect_to root_path
      flash[:notice].should == "Thanks for signing up for our mailing list. We'll be in touch soon!"
    end
  end

  context "when the source is a game" do
    it "should redirect to the game page" do
      post :create, signup: {source: "astro_defenders", email: "foo@bar.com"}
      Signup.last.email.should == "foo@bar.com"
      response.should redirect_to product_detail_path(name: "astro_defenders")
      flash[:notice].should == "Thanks for signing up for our mailing list. We'll be in touch soon!"
    end
  end

end
