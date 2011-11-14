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
    @hotels = @trip.hotels
    @messages = Trip.find(params[:id]).messages.all
    @message = Message.new
    
    render :layout => 'trip_layout'
  end

  def create
    if @trip = Trip.create(params[:trip])
      redirect_to new_guests_path(:trip_id => @trip.id), :notice => "Trip successfully created!"
    else
      redirect_to new_trip_url, :notice => "You missed some things."
    end
  end
  
  def add_users
    email_list = params[:emails]
    @trip = Trip.find(params[:trip_id])
    email_list.each do |key, value|
      @trip.users.create(:email => value, :password => "password", :password_confirmation => "password")
    end
    @trip.save
    redirect_to new_hotel_url(:trip_id => @trip.id)
  end
  
  
end
