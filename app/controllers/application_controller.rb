class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :add_body_class

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  private

  def add_body_class
    @body_class = "#{controller_name}-#{action_name}"
  end
end
