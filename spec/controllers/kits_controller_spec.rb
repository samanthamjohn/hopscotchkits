require 'spec_helper'

describe KitsController do
  before do
    user = create(:user, role: "admin", name: "evan")
    sign_in user
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

  describe "update" do
    it "should update the kit" do
      kit = Kit.create!(slug: 'foo', description: "Foo")
      put :update, id: kit.to_param, kit: {description: "Bar"}
      response.should redirect_to edit_kit_path(kit)
      kit.reload.description.should == 'Bar'
    end
  end

  describe "new" do
    it "should render the new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "create" do
    it "should create a new kit" do
      post :create, kit: {slug: "bar"}
      kit = Kit.last
      kit.slug.should == "bar"
      response.should redirect_to edit_kit_path(kit)
    end
  end

  describe "#analytics" do
    it "should load the kit and all its programs" do
      kit = Kit.create!(slug: 'foo')
      program = create(:program, kit: kit)
      step = Step.create!(kit: kit, position: 1)
      get :analytics, id: "foo"
      assigns(:kit).should == kit
      assigns(:programs).should == [program]
      assigns(:steps).should == [step]
    end

    it "should assign the paginated complete programs" do
      step = create(:step, position: 8)
      step1 = create(:step, position: 1, kit: step.kit)
      complete_program = create(:program, kit: step.kit)
      get :analytics, id: step.kit.to_param
      assigns(:incomplete_programs).map(&:id).should == [complete_program.id]

      complete_program.reload.update_attribute(:step_id, step.id)
      get :analytics, id: step.kit.to_param
      assigns(:complete_programs).map(&:id).should == [complete_program.id]
    end
  end

end
