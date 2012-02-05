class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  
  helper_method :current_user, :logged_in?, :current_user_trips_url
  

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end
  
  def current_user_trips_url
    if logged_in?
      trip_url(current_user.trips.last.id)
    else
      root_url
    end
  end
  

  
  
      
end
