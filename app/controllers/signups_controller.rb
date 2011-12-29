class SignupsController < ApplicationController
  def create
    @signup = Signup.create(params[:signup])
    redirect_to root_path
  end
end
