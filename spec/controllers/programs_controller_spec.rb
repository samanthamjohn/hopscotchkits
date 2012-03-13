require 'spec_helper'

describe ProgramsController do
  describe "#root" do
    context "the user is not signed in" do
      it "should render the new page" do
        kit = Kit.create!(slug: "foo")
        get :root, :kit_id => kit.to_param
        assigns(:kit).should == kit
        response.should render_template("new")
      end
    end

    context "the user is signed in" do
      it "should render the my page" do
        user = create(:user)
        sign_in user
        kit = Kit.create!(slug: "puppy")
        get :root, kit_id: kit.to_param
        response.should render_template("my")
      end
    end
  end


  describe "#new_form" do
    context "they have already started a program" do
      it "should also assign the current_program instance variable" do
        program = create(:program)
        session[:program_id] = program.id
        kit = create(:kit)
        get :new_form, kit_id: kit.to_param
        assigns(:program).kit.should == kit
        assigns(:current_program).should == program
        response.should render_template "new_form"
        response.should_not render_template "layouts/application"
      end
    end
    context "there is no program session" do
      it "should render the new form partial" do
        kit = create(:kit)
        get :new_form, kit_id: kit.to_param
        assigns(:program).kit.should == kit
        assigns(:current_program).should be_nil
        response.should render_template "new_form"
        response.should_not render_template "layouts/application"
      end
    end
  end

  describe "#new" do
    it "should render the new page" do
      kit = Kit.create(slug: "foo")
      get :new, :kit_id => kit.to_param
      assigns(:kit).should == kit
      response.should render_template("new")
    end
  end

  describe "#create" do
    it "should set the name and a session variable" do
      kit = Kit.create(slug: "foo")
      post :create, kit_id: kit.to_param, program: { kit_id: kit.id, name: "FOO" }
      program = Program.last
      program.name.should == "FOO"
      session[:program_id].should == program.id
      response.should redirect_to edit_program_path(program)
    end
  end

  describe "#edit" do
    it "should render the edit template" do
      kit = Kit.create(slug: "foo")
      program = create(:program, kit: kit)
      get :edit, kit_id: kit.to_param, id: program.to_param
      assigns(:program).should == program
      response.should be_success
    end

    it "should default to current_step" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2)
      program = Program.create(kit: kit, step_id: step.id)
      get :edit, kit_id: kit.to_param, id: program.to_param
      assigns(:step).should == step
    end

    it "should set the step" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit)
      step = Step.create!(kit_id: kit.id, position: 2)
      get :edit, kit_id: kit.to_param, id: program.to_param, step: step.position
      assigns(:step).should == step
    end

    context "when the step_param is freeplay" do
      it "should set the step as the freeplay step if present" do
        kit = Kit.create(slug: "foo")
        program = Program.create(kit: kit)
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
      program = Program.create(kit: kit, code: "foo", current_step: step)
      get :data, id: program.to_param
      response.body.should == {step: step, program: program}.to_json
    end

    context "when a step param is passed in" do
      it "should set the step to the freeplay step" do
        step_1 = create(:step, position: 1)
        step = create(:step, kit: step_1.kit, freeplay: true, position: 2)
        program = create(:program, kit: step.kit)
        get :data, id: program.to_param, step: 'freeplay'
        program.reload.current_step.should == step
      end

      it "should set the step to the passed in step." do
        step = create(:step, position: 3)
        program = create(:program, kit: step.kit)
        get :data, id: program.to_param, step: step.position
        program.reload.current_step.should == step
      end
    end
  end

  describe "#name" do
    it "should set the programs name" do
      kit = Kit.create!(slug: "foo")
      program = Program.create(kit: kit, code: "foo")
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
      program = create(:program, kit: kit)
      post :update, kit_id: kit.to_param, id: program.to_param, program: {code: "var x = 3;"}
      assigns(:program).code.should == "var x = 3;"
    end

    context "the program already has a user" do
      it "should not switch the programs user" do
        user = create(:user)
        new_user = create(:user)
        program = create(:program, user: user)
        post :update, id: program.to_param, program: {user_id: new_user.id}
        program.reload.user.should == user
      end
    end
  end

  describe "#mobile" do
    it "should render the mobile page with the code layout" do
      program = create(:program)
      get :mobile, id: program.to_param
      response.should be_success
      response.should render_template(:code)
      response.should render_template("mobile")
    end
  end
  describe "#next_step" do
    it "should render the next step as json" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2)
      step2 = Step.create!(kit_id: kit.id, position: 3)
      program = Program.create(kit: kit, current_step: step)
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
      program = Program.create(kit: kit)
      get :show, kit_id: "foo", id: program.to_param
      response.should render_template("show")
      response.should render_template("layouts/application")
      assigns(:program).should == program
    end

    it "should default to current_step" do
      kit = Kit.create(slug: "foo")
      step = Step.create!(kit_id: kit.id, position: 2)
      program = Program.create(kit: kit, step_id: step.id)
      get :show, kit_id: kit.to_param, id: program.to_param
      assigns(:step).should == step
    end

    it "should set the step" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit)
      step = Step.create!(kit_id: kit.id, position: 2)
      get :show, kit_id: kit.to_param, id: program.to_param, step: step.position
      assigns(:step).should == step
    end
  end

  describe "#gallery" do
    it "should only show the programs that are featured in order" do
      featured_old = create(:program, featured: true, updated_at: 1.day.ago)
      featured_new = create(:program, featured: true)
      unfeatured = create(:program, featured: false)
      get :gallery
      assigns(:programs).map(&:id).should == [featured_new.id, featured_old.id]
    end
  end

  describe "#feature" do
    it "should feature the program" do
      user = create(:user, role: 'admin')
      sign_in user
      program = create(:program, updated_at: Time.parse('july 1, 2011'))
      put :feature, id: program.id, program: {featured: true}
      program.reload.updated_at.should == Time.parse('july 1, 2011')
      program.featured?.should be
      response.should be_success
    end

    it "should unfeature the program" do
      user = create(:user, role: 'admin')
      sign_in user
      program = create(:program, featured: true)
      put :feature, id: program.id, program: {featured: 'false'}
      program.reload.featured?.should_not be
      response.should be_success
    end
  end

  describe "destroy" do
    it "should delete the record" do
      kit = Kit.create(slug: 'puppy')
      program = create(:program, kit: kit)
      delete :destroy, id: program.to_param, kit_id: kit.to_param
      lambda {
        program.reload
      }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
