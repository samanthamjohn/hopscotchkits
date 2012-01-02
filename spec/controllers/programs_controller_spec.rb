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
      post :create, kit_id: kit.to_param, program: { kit_id: kit.id, name: "Evan"}
      program = Program.last
      program.name.should == "Evan"
      response.should redirect_to edit_kit_program_path(kit, program)
    end
  end

  describe "#edit" do
    it "should render the edit template" do
      kit = Kit.create(slug: "foo")
      program = Program.create(kit: kit, name: "Evan")
      get :edit, kit_id: kit.to_param, id: program.to_param
      assigns(:program).should == program
      response.should be_success
    end
  end

end
