class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  
  def index
    @messages = Trip.find(params[:trip_id]).messages.all
    @message = Message.new
  end
  
  def create
    @message = current_user.messages.new(params[:message])
    @message.trip = Trip.find(params[:id])
    if @message.save
      redirect_to trip_url(params[:id]), :notice => "Posted!"
    else
      redirect_to trip_url(params[:id]), :notice => "Try again!"
    end
  end
end
