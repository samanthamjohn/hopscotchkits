require 'spec_helper'

describe StepsController do

  before do
    user = User.create!(role: "admin", name: "evan")
    session[:user_id] = user.id
  end

  describe "update" do
    it "should update the step and redirect to the kit" do
      step = create(:step)
      post :update, id: step.id, step: {description: "foo"}
      response.should redirect_to edit_kit_path(step.kit)
      step.reload.description.should == 'foo'
    end
  end

  describe "create" do
    it "should create the step and redirect to the kit" do
      kit = create(:kit)
      post :create, step: {kit_id: kit.id, description: "foo", position: 2}
      response.should redirect_to edit_kit_path(kit)
      Step.last.description.should == 'foo'
    end
  end

  describe "destroy" do
    it "should delete the step and redirect to the kit" do
      step = create(:step)
      delete :destroy, id: step.id
      response.should redirect_to edit_kit_path(step.kit)
      lambda { step.reload }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
