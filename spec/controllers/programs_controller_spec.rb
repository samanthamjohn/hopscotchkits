require 'spec_helper'

describe ProgramsController do
  describe "#root" do
    context "the user is not signed in" do
      it "should render the new page" do
        kit = Kit.create!(slug: "foo")
        get :root, :kit_id => kit.to_param
        assigns(:program).kit.should == kit
        response.should render_template("new")
      end
    end

    context "the user is signed in" do
      it "should render the my page" do
        user = User.create!(name: "sam")
        session[:user_id] = user.id
        kit = Kit.create!(slug: "puppy")
        get :root, kit_id: kit.to_param
        response.should render_template("my")
      end
    end
  end

  describe "#new" do
    it "should render the new page" do
      kit = Kit.create(slug: "foo")
      get :new, :kit_id => kit.to_param
      assigns(:program).kit.should == kit
      response.should render_template("new")
    end
  end

  describe "#create" do
    it "should set the name" do
      kit = Kit.create(slug: "foo")
      post :create, kit_id: kit.to_param, program: { kit_id: kit.id, user_attributes: {name: "Evan"} }
      program = Program.last
      program.user.name.should == "Evan"
      response.should redirect_to edit_kit_program_path(kit, program)
    end
  end

  describe "#edit" do
    it "should render the edit template" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: {name: "Evan"})
      get :edit, kit_id: kit.to_param, id: program.to_param
      assigns(:program).should == program
      response.should be_success
    end

    it "should default to current_step" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2)
      program = Program.create(kit: kit, step_id: step.id, user_attributes: {name: "Evan"})
      get :edit, kit_id: kit.to_param, id: program.to_param
      assigns(:step).should == step
    end

    it "should set the step" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: {name: "Evan"})
      step = Step.create!(kit_id: kit.id, position: 2)
      get :edit, kit_id: kit.to_param, id: program.to_param, step: step.position
      assigns(:step).should == step
    end

    context "when the step_param is freeplay" do
      it "should set the step as the freeplay step if present" do
        kit = Kit.create(slug: "foo")
        program = Program.create(kit: kit, user_attributes: {name: "Evan"})
        step = Step.create!(kit_id: kit.id, position: 2, freeplay: true)
        get :edit, kit_id: kit.to_param, id: program.to_param, step: "freeplay"
        assigns(:step).should == step
      end
    end
  end

  describe "#data" do
    it "should return the program and the step" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2, freeplay: true)
      step2 = Step.create!(kit_id: kit.id, position: 3)
      program = Program.create(kit: kit, user_attributes: {name: "Evan"}, code: "foo", current_step: step)
      get :data, id: program.to_param
      response.body.should == {step: step, program: program}.to_json
    end
  end

  describe "#name" do
    it "should set the programs name" do
      kit = Kit.create!(slug: "foo")
      program = Program.create(kit: kit, user_attributes: {name: "Evan"}, code: "foo")
      post :name, id: program.to_param, value: 'Sam is cool'
      response.body.should == "Sam is cool"
    end
  end

  describe "iframe" do
    it "should return the program's iframe with code layout" do
      program = create(:program)
      get :iframe, id: program.id
      response.should render_template('layouts/code')
      response.should render_template('iframe')
    end
  end

  describe "#update" do
    it "should update the program" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: { name: "Evan" })
      post :update, kit_id: kit.to_param, id: program.to_param, program: {code: "var x = 3;"}
      assigns(:program).code.should == "var x = 3;"
    end
  end

  describe "#next_step" do
    it "should render the next step as json" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2)
      step2 = Step.create!(kit_id: kit.id, position: 3)
      program = Program.create(kit: kit, user_attributes: { name: "Evan"}, current_step: step)
      get :next_step, kit_id: kit.to_param, id: program.to_param
      assigns(:program).reload.current_step.should == step.next_step
      resp = JSON.parse(response.body)
      resp["step"]["id"].should == step2.id
      resp["program"]["id"].should == program.id
    end

  end

  describe "#show" do
    it "should show the code" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: { name: "Evan" })
      get :show, kit_id: "foo", id: program.to_param
      response.should render_template("show")
      response.should render_template("layouts/application")
      assigns(:program).should == program
    end

    it "should default to current_step" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2)
      program = Program.create(kit: kit, step_id: step.id, user_attributes: {name: "Evan"})
      get :show, kit_id: kit.to_param, id: program.to_param
      assigns(:step).should == step
    end

    it "should set the step" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: {name: "Evan"})
      step = Step.create!(kit_id: kit.id, position: 2)
      get :show, kit_id: kit.to_param, id: program.to_param, step: step.position
      assigns(:step).should == step
    end
  end

  describe "#gallery" do
    it "should only show the programs that are featured" do
      featured = create(:program, featured: true)
      unfeatured = create(:program, featured: false)
      get :gallery
      assigns(:programs).map(&:id).should == [featured.id]
    end
  end

  describe "destroy" do
    it "should delete the record" do
      kit = Kit.create(slug: 'puppy')
      program = Program.create(kit: kit, user_attributes: {name: "Evan"})
      delete :destroy, id: program.to_param, kit_id: kit.to_param
      lambda {
        program.reload
      }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
