class TripsController < ApplicationController
  def index
    @trips = current_user.trips.all
    
  end
  def new
    @trip = Trip.new
  end
  
  def show
    @trip = Trip.find(params[:id])
    @guests = @trip.users
  end

  def create
    @trip = current_user.trips.new(params[:trip])
    if @trip.save
      redirect_to trip_url(@trip), :notice => "Trip successfully created!"
    else
      redirect_to new_trip_url, :notice => "You missed some things."
    end
    
    @trip.guest_list.split(", ").each do |email|
      @trip.users.create(:email => email, :password => "password", :password_confirmation => "password")
    end
  end
end
