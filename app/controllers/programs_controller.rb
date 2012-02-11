class ProgramsController < ApplicationController
  before_filter :load_program, except: ["new", "create", "index", "root"]
  load_and_authorize_resource only: "index"

  def root
    if session[:user_id]
      render "my"
    else
      new
      render "new"
    end
  end

  def new
    @body_class = "programs new"
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
    @program = Program.find(params[:id])
    @program.update_attributes(current_step: @program.next_step)
    render json: @program.current_step
  end

  def data
    render json: { step: @program.current_step, program: @program }
  end

  def name
    @program.update_attributes(name: params[:value])
    render text: @program.name
  end

  def show
    @step = @program.kit.steps.find_by_position(params[:step])
    @step ||= @program.current_step
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
