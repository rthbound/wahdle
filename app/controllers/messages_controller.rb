class MessagesController < ApplicationController
  before_filter :trip
  before_filter :new_message, only: [:new, :index]
  before_filter :trip_messages, only: [:index]
    
  def create
    @message = current_user.messages.build(params[:message].merge(trip_id: @trip.id))
    message = (@message.save ? "Posted!" : "Try again!")
    redirect_to @trip, notice: message
  end
  
  private
  def new_message
    @message ||= Message.new
  end
  
  def trip_messages
    @messages ||= trip.messages
  end
  
  def trip
    @trip ||= Trip.find(params[:id])
  end
end
