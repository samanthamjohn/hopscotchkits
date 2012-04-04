class Admin::KitsController < ApplicationController
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
    redirect_to edit_admin_kit_path(@kit)
  end

  def update
    @kit.update_attributes(params[:kit])
    redirect_to edit_admin_kit_path(@kit)
  end

  def analytics
    @programs = @kit.programs.order("programs.created_at DESC").includes(:user, :current_step, :snapshots)
    @steps = @kit.steps
    @freeplay_step = @kit.freeplay_step
    @num_steps = @kit.num_steps
    @last_step = @kit.step(@num_steps)
    @complete_programs = @programs.joins(:current_step).where("steps.position >= #{@kit.num_steps}").paginate(page: params[:page])
    @incomplete_programs = @programs.joins(:current_step).where("steps.position < #{@kit.num_steps}").paginate(page: params[:page], per_page: 100)
  end

  private

  def set_body_class
    @body_class = "admin-kit"
  end

end
