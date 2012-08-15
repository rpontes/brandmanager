class ApplicationController < ActionController::Base
  protect_from_forgery
	helper_method :current_user, :logged_in?

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def require_authentication
    redirect_to login_path,
      :alert => t("flash.login.required") unless logged_in?
  end
end
