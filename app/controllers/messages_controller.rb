class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  
  def index
    @messages = Message.all
    @message = Message.new
  end
  
  def create
    @message = current_user.messages.new(params[:message])
    if @message.save
      redirect_to messages_url, :notice => "Posted!"
    else
      redirect_to messages_url, :notice => "Try again!"
    end
  end
end
