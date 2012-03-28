class RegistrationsController < Devise::RegistrationsController

  def new
    Rails.logger.info("NEW REGISTRATION")
    super
  end

  def create
    Rails.logger.info(params)
    user = User.new(params[:user])
    if session[:program_id]
      program = Program.find(session[:program_id])
      user.programs << program
    end
    if user.save
      sign_in(user)
      render json: user, status: 201
    else
      render json: user.errors, status: 400
    end
    # super
    #or something similar to update.js
  end

  def update
    Rails.logger.info("UPDATE REGISTRATION")
    super
  end
end
