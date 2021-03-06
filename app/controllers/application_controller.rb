class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  
  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in"
    end
  end

  def prevent_login_signup
    if session[:user_id]
      redirect_to user_spheres_path(user_id: session[:user_id]), notice: "You are already logged in"
    end
  end

  def current_user
  	return unless session[:user_id]
  	@current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

end
