class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin
    if current_user.try(:admin?)
      return
    else
      redirect_to root_url
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :newsletter])
    update_attrs = [:name, :email, :newsletter, :current_password, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end


end
