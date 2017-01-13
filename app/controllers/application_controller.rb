class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  #allowing the parameter to be accted by the devise (similar to params under every controller)
  devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
end

end
