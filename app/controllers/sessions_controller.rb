class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing in!"
      
      
      redirect_to trip_url(user.trips.last.id)
      #redirect_to user_url(current_user)
    else
      flash[:notice] = "Please try again!"
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url
    flash[:notice] = "You are now logged out!"
  end
  
end
