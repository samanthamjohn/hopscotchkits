require 'spec_helper'

describe StepsController do

  before do
    user = User.create!(role: "admin", name: "evan")
    session[:user_id] = user.id
  end

  describe "update" do
    it "should update the step and redirect to the kit" do
      kit = Kit.create!(slug: "Fool")
      step = Step.create!(kit_id: kit.id)
      post :update, id: step.id, step: {kit_id: kit.id, description: "foo"}
      response.should redirect_to edit_kit_path(kit)
      step.reload.description.should == 'foo'
    end
  end

end
