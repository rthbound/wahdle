class UserMailer < ActionMailer::Base
  default from: "dmlevi@gmail.com"
  
  def welcome_email(user,trip)
     @user = user
     @trip = trip
     @planner = trip.planner
     @url  = "http://alpha.wahdle.com"
     mail(:to => user.email, :subject => "You're invited to a trip!")
   end
  
  
end
