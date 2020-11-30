class ApplicationController < ActionController::Base
  before_action :configure_divise_parameters, if: :devise_controller?

  def configure_divise_parameters
    devise_parameter_sanitizer.permit(:sing_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation)}
end
