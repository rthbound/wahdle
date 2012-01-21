class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    
    @trip = Trip.find(params[:trip_id])
    @user= current_user || @trip.users.new(params[:user])
    
    
    
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      Join.create(:user_id=>@user.id,:trip_id=>@trip.id,:planner=>TRUE)
      p "SAVED JOIN #{@user.id}, #{@trip.id}"  
      redirect_to trip_url(params[:trip_id])
    else
      flash[:notice] = "Please try to sign up again."
      render :new
    end
  end
  
  def new_guest
  end
  
  def show
    
    @trips = Array.new
    Join.find_all_by_user_id(current_user.id).each do |join|
    @trips << join.trip
    end
    render :layout => 'trip_layout'
  end

end