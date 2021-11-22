class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  FIELDS = [
    :first_name, :last_name, :dob, :phone, :occupation, :address, :bio, :email,
    :password, :password_confirmation, :current_password
  ]

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(FIELDS) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(FIELDS) }
    end
end
