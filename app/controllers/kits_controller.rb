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
    @users = User.where("role IS NULL")
    @programs = @kit.programs.joins(:user).where("users.role IS NULL").order("created_at DESC")
    @steps = @kit.steps
    @complete_programs = @programs.joins(:current_step).where("steps.position >= 8").paginate(page: params[:page])
    @incomplete_programs = @programs.joins(:current_step).where("steps.position < 8").paginate(page: params[:page], per_page: 100)
  end

  private

  def set_body_class
    @body_class = "kit"
  end

end
