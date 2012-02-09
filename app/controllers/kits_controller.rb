class KitsController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  before_filter :set_body_class

  def index
  end

  def edit
  end

  def new
  end

  def create
    @kit = Kit.create(params[:kit])
    redirect_to edit_kit_path(@kit)
  end

  def update
    @kit.update_attributes(params[:kit])
    redirect_to edit_kit_path(@kit)
  end

  def analytics
    @users = User.where('id <> 3')
    @programs = @kit.programs.where("user_id <> 3")
    @steps = @kit.steps
  end

  private

  def set_body_class
    @body_class = "kit"
  end

end
