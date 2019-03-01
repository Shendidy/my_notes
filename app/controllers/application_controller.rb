class ApplicationController < ActionController::Base

  # To facilitate signing up with a user_name or email
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ----------

  def after_sign_in_path_for(resource)
    categories_path
  end

  # To facilitate signing up with a user_name or email
  protected

  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  #-----------
end
