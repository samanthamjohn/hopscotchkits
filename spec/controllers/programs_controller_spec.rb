require 'spec_helper'

describe ProgramsController do

  describe "#new" do
    it "should render the new page" do
      kit = Kit.create(slug: "foo")
      get :new, :kit_id => kit.to_param
      assigns(:program).kit.should == kit
      response.should be_success
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
  end

  describe "#update" do
    it "should update the program" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: { name: "Evan" })
      post :update, kit_id: kit.to_param, id: program.to_param, program: {code: "var x = 3;"}
      assigns(:program).code.should == "var x = 3;"
    end
  end

  describe "#show" do
    it "should show the code with the code layout" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, user_attributes: { name: "Evan" })
      get :show, kit_id: "foo", id: program.to_param
      response.should render_template("show")
      response.should render_template("layouts/code")
      assigns(:program).should == program
    end
  end

end