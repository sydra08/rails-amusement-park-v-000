class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login, except: [:home, :new, :create]

  private

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
