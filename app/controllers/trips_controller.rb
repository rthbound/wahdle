class TripsController < ApplicationController
  include Suitcase
  
  def index
    @trips = current_user.trips.all 
  end
  
  def new
    @trip = Trip.new
  end
  
  def show
    @trips = current_user.trips.all
    
    p "START"
    @trips.each {|i| p i.name}
    p "END"
    
    @trip = Trip.find(params[:id])
    
    @guests = @trip.users
    lodgings = @trip.lodgings
    a=[]
    lodgings.each {|i| a<<i.ean_hotel_id}
    
    
    
    @hotels = Hotel.find(:ids=>a )
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
    redirect_to new_lodging_url(:trip_id => @trip.id)
  end
  
  def location_search
    begin
      @locations = Suitcase::Hotel::Location.find(:destination_string => params[:location])
    rescue
      @locations = []
    end
    render 'autocomplete'
  end
  
end
