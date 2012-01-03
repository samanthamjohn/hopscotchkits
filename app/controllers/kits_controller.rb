class KitsController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  before_filter :set_body_class

  def index
  end

  def edit
  end


  private

  def set_body_class
    @body_class = "kit"
  end

end
