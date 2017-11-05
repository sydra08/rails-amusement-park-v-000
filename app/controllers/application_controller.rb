class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  # def require_admin
  #   unless current_user.admin?
  #     flash[:error] = "You must be an admin user to do that"
  #     redirect_to root_path
  #   end
  # end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
