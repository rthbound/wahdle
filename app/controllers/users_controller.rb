class UsersController < ApplicationController
 
 
  def new
    @user = User.new
  end
  
  def create
    
    
 
    @trip = Trip.find(params[:trip_id])
    
    
    # Look for existing user my email... if not found create new user
    @user= current_user || User.find_by_email(params[:user][:email])|| User.new(params[:user])
    
    if @user.save
      session[:user_id] = @user.id
      Join.create(:user_id=>@user.id,:trip_id=>@trip.id,:planner=>TRUE)
      p "SAVED JOIN #{@user.id}, #{@trip.id}"  
      flash[:notice] = "Thanks for signing up!"
      redirect_to trip_url(params[:trip_id])
    else
      flash[:notice] = "Please try to sign up again."
      render :new
    end
  end
  
  def new_guest
  end
  
   # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

    unless logged_in? && current_user==@user
            redirect_to root_url
            flash[:notice] = "Please sign in!"
    end
    
  end
  
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to trip_url(@user.trips.last.id), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def show
    
    @trips = Array.new
    Join.find_all_by_user_id(current_user.id).each do |join|
    @trips << join.trip
    end
    render :layout => 'trip_layout'
  end

end