class ProgramsController < ApplicationController
  before_filter :load_program, except: ["new", "create"]

  def new
    kit= Kit.find_by_slug(params[:kit_id])
    @program = Program.new(kit: kit, user: User.new)
  end

  def create
    program_attrs = params[:program]
    @program = Program.create(program_attrs)
    session[:user_id] = @program.user.id
    redirect_to edit_kit_program_path(kit_id: params[:kit_id], id: @program.to_param)
  end

  def edit
  end

  def update
    @program.update_attributes(params[:program])
    head :ok
  end

  def show
    render "show", layout: 'code'
  end

  private

  def load_program
    program_id = Program.joins(:user, :kit).where("users.slug = ?",params[:id]).where('kits.slug = ?', params[:kit_id]).first.id
    @program = Program.find(program_id)
  end
end
