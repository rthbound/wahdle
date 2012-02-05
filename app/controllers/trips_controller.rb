class TripsController < ApplicationController
  include Suitcase
    

 
  def index
    unless logged_in? 
            flash[:notice] = "Please sign in!"
            redirect_to root_url
    else
      @trips = current_user.trips.all 
    end
  end
  
  def new
    p @email=params[:email]
    p @password=params[:ref]
    
    
    if @email && @password
      user = User.find_by_email(@email)
      if user && user.authenticate(@password)
        session[:user_id] = user.id
        flash[:notice] = "Thank you for signing in!"
        redirect_to trip_url(user.trips.last.id)
       #redirect_to edit_user_url(current_user.id)
      end
    else
      @trip = Trip.new
    end
  end
  
  def show
    
    unless logged_in? 
        flash[:notice] = "Please sign in!"
        redirect_to root_url
    else      
  
    
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
  end

  def create
    if @trip = Trip.create(params[:trip])
      redirect_to new_guests_path(:trip_id => @trip.id)
    else
      redirect_to new_trip_url, :notice => "You missed some things."
    end
  end
  
  def add_users
    email_list = params[:emails]
    @trip = Trip.find(params[:trip_id])
    
    email_list.each do |key, value|
      unless @user=User.find_by_email(value)
          @user= User.create(:email => value, :password => "password", :password_confirmation => "password")      
          @user.password="187100#{@user.id}"
          @user.password_confirmation="187100#{@user.id}"
          @user.save
      end
      Join.create(:user_id=>@user.id,:trip_id=>@trip.id,:planner=>false)
    end
    
    @trip.save
    redirect_to new_lodging_url(:trip_id => @trip.id)
  end
  
  def launch
    @trip = Trip.find(params[:id])
    
    unless logged_in? 
        flash[:notice] = "Please sign in!"
        redirect_to root_url
    else
        if current_user==@trip.planner
          
          @trip.guests.each do |user|
            UserMailer.welcome_email(user, @trip).deliver
          end
        else
          flash[:notice] = "User is not authorized to launch trip"
          redirect_to root_url
        end
    end
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
