class RegistrationsController < Devise::RegistrationsController

  def new
    Rails.logger.info("NEW REGISTRATION")
    super
  end

  def create
    Rails.logger.info(params)
    user = User.new(params[:user])
    if user.save
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
