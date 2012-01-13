class ProgramsController < ApplicationController
  before_filter :load_program, except: ["new", "create", "index", "root"]
  load_and_authorize_resource only: "index"

  def root
    kit= Kit.find_by_slug(params[:kit_id])
    @program = Program.new(kit: kit, user: User.new)
    if session[:user_id]
      render "my"
    else
      render "new"
    end
  end

  def new
    kit= Kit.find_by_slug(params[:kit_id])
    @program = Program.new(kit: kit, user: User.new)
  end

  def create
    program_attrs = params[:program]
    @program = Program.create!(program_attrs)
    @program.reload
    session[:user_id] = @program.user.id
    redirect_to edit_kit_program_path(kit_id: params[:kit_id], id: @program.to_param)
  end

  def edit
    if params[:step] == "freeplay"
      @step = @program.kit.freeplay_step
    else
      @step = @program.kit.steps.find_by_position(params[:step])
    end
    @step ||= @program.current_step
  end

  def update
    @program.update_attributes(params[:program])
    head :ok
  end

  def next_step
    @program.update_attributes(params[:program])
    redirect_to edit_kit_program_path(@program.kit, @program, step: @program.current_step.position)
  end

  def show
    @step = @program.kit.steps.find_by_position(params[:step])
    @step ||= @program.current_step
    render "show", layout: 'code'
  end

  def index
  end

  def destroy
    @program.destroy
    redirect_to root_path
  end

  private

  def load_program
    @program = Program.find(params[:id])
  end
end
