class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back, #{user.name}!"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
