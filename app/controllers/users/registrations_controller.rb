class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :city
    devise_parameter_sanitizer.for(:sign_up) << :picture
    devise_parameter_sanitizer.for(:sign_up) << :picture_cache
  end

  def after_sign_up_path_for(user)
    user_path(user)
  end
end
