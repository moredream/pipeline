class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  protected
  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome"
    root_path

    # unless current_user.profile.nil?
    #   flash[:notice] = "Welcome"
    #   root_path
    # else
    #   flash[:alert] = "Please complete your profile"
    #   new_profile_path
    # end
  end

  # def after_sign_up_path_for(resource)

  # end

  # def after_update_path_for(resource)
  #   user_path(resource)
  # end
  # profile_attributes: [:bio]

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, profile_attributes: [:bio,:twitter] ) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password ,:image,:remote_image_url) }
  end
end
