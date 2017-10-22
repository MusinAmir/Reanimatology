class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :irk])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :irk])

  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end
end
