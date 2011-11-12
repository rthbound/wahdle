class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end
  
  def show
    @trip = Trip.find(params[:id])
    @guests = @trip.guest_list.split(", ")
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      redirect_to trip_url(@trip), :notice => "Trip successfully created!"
    else
      redirect_to new_trip_url, :notice => "You missed some things."
    end
    # User.find(session[:user_id]).trips = @trip
    # @emails = @trip.guest_list.split(", ")
    # @emails.each do |email|
    #   @trip.users.create(:email => email, :password => "password", :password_confirmation => "password")
    # end
  end
end
