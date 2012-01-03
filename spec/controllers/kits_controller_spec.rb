require 'spec_helper'

describe KitsController do
  before do
    user = User.create!(role: "admin", name: "evan")
    session[:user_id] = user.id
  end

  describe "#index" do
    it "should show all the kits" do
      kit = Kit.create!(slug: "Foo")
      get :index
      response.should render_template :index
      assigns(:kits).should include(kit)
    end
  end

  describe "edit" do
    it "should render the edit template" do
      kit = Kit.create!(slug: "Foo")
      get :edit, id: kit.to_param
      response.should render_template :edit
    end
  end

end
