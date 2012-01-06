class SignupsController < ApplicationController
  authorize_resource only: [:index]
  def create
    @signup = Signup.create(params[:signup])
    if @signup.source == "homepage"
      redirect_to root_path, notice: "Thanks for signing up for our mailing list. We'll be in touch soon!"
    else
      redirect_to product_detail_path(name: @signup.source), notice: "Thanks for signing up for our mailing list. We'll be in touch soon!"
    end
  end

  def index
    @signups = Signup.group("source").order("created_at DESC")
  end
end
