class RidesController < ApplicationController
  before_action :require_login

  def new
    ride = Ride.create(user: current_user, attraction_id: params[:attraction_id])
    flash[:alert] = ride.take_ride
    redirect_to user_path(current_user)
  end
end
