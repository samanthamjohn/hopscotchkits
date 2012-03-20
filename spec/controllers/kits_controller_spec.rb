require 'spec_helper'

describe KitsController do
  describe "#index" do
    it "should display all the published kits and some featured programs" do
      kit = create(:kit, published: true)
      program = create(:program, featured: true)
      unpublished = create(:kit, published: false)
      get :index
      assigns(:kits).should == [kit]
      assigns(:programs).should == [program]
    end
  end

end
