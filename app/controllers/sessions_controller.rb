class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if session[:program_id]
      program = Program.find(session[:program_id])
      resource.programs << program
    end
    render json: resource, status: :created
  end

end
