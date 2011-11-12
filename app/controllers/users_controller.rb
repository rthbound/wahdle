class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      redirect_to new_trip_url
    else
      flash[:notice] = "Please try to sign up again."
      render :new
    end
  end
  
end
