class SignupsController < ApplicationController
  def create
    @signup = Signup.create(params[:signup])
    redirect_to root_path, notice: "Thanks for signing up for our mailing list. We'll be in touch soon!"
  end
end
