class ProgramsController < ApplicationController
  before_filter :load_program, except: ["new", "create", "index", "root", "gallery", "new_form", "my"]
  load_and_authorize_resource only: ["index", "feature"]

  def my
    if current_user
      render "my"
    else
      redirect_to root_path
    end
  end

  def new
    @body_class = "programs new"
    @kit= Kit.find_by_slug(params[:kit_id])
    @programs = Program.featured.where(kit_id: @kit.id)
  end

  def new_form
    kit = Kit.find_by_slug(params[:kit_id])
    if session[:program_id]
      @current_program = Program.find(session[:program_id])
      @current_program = nil unless @current_program.kit == kit
    else
      @current_program = nil
    end
    @program = Program.new(kit: kit)
    render partial: "new_form"
  end

  def create
    program_attrs = params[:program]
    @program = Program.create!(program_attrs)
    session[:program_id] = @program.id
    redirect_to edit_program_path(@program)
  end

  def edit
    if params[:step] == "freeplay"
      @step = @program.kit.freeplay_step
    elsif params[:step]
      @step = @program.kit.steps.find_by_position(params[:step])
    end
    @step ||= @program.current_step
  end

  def update
    if @program.user
      params[:program].reject!{|p| p == "user_id"}
    end
    @program.update_attributes(params[:program])
    head :ok
  end

  def next_step
    @program.update_attributes(current_step: @program.next_step)
    render json: { step: @program.current_step, program: @program }
  end

  def previous_step
    @program.update_attributes(current_step: @program.previous_step)
    render json: { step: @program.current_step, program: @program }
  end

  def data
    if params['step'] == 'freeplay'
      @program.current_step = @program.kit.steps.where(freeplay: true).first
      @program.save
    elsif params['step']
      @program.current_step = @program.kit.steps.where(position: params['step']).first
      @program.save
    end
    render json: { step: @program.current_step, program: @program }
  end

  def name
    @program.update_attributes(name: params[:value])
    render text: @program.name
  end

  def iframe
    render layout: 'code'
  end

  def show
    @step = @program.kit.steps.find_by_position(params[:step])
    @step ||= @program.current_step
  end

  def show_code
  end

  def mobile
    render :mobile, layout: "code"
  end

  def index
  end

  def gallery
    @programs = Program.where(featured: true).order("updated_at DESC").limit(21)
  end

  def feature
    Program.record_timestamps = false
    @program.update_attributes(params[:program])
    Program.record_timestamps = true
    head :ok
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
