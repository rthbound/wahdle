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
    if @trip = current_user.trips.create(params[:trip])
      redirect_to new_guests_path(:trip_id => @trip.id), :notice => "Trip successfully created!"
    else
      redirect_to "users/new_guests", :notice => "You missed some things."
    end
  end
  
  def add_users
    email_list = params[:emails]
    @trip = Trip.find(params[:trip_id])
    email_list.each do |key, value|
      @trip.users.create(:email => value, :password => "password", :password_confirmation => "password")
    end
    @trip.save
    redirect_to trip_url(@trip)
  end
  
end
