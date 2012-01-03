class UsersController < ApplicationController
  def login
    user = User.find_by_token(params[:token])
    session[:user_id] = user.id
    head :ok
  end
end
