class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method [:resource_name, :resource, :devise_mapping]
  before_filter :add_body_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private

  def add_body_class
    @body_class = "#{controller_name}-#{action_name}"
  end
end
