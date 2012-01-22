class LodgingsController < ApplicationController
    
    include Suitcase
   
    def new
      @trip = Trip.find(params[:trip_id])
      @hotels = Hotel.find(:location => @trip.destination, :results => 100)
    end
    
    def create
      
      hotel_list = params[:hotels]
      @trip = Trip.find(params[:trip_id])
      
      unless hotel_list.nil? 
        @list = hotel_list.map do |value|
          @trip.lodgings.create(:ean_hotel_id => value)
        end
      end
      
       if @list 
          
          if current_user
             Join.create(:user_id=>current_user.id,:trip_id=>@trip.id,:planner=>TRUE)
             redirect_to trip_url(params[:trip_id]), :notice => "Trip successfully created!"
          else
              redirect_to new_user_url(:trip_id => @trip.id), :notice => "Trip successfully created!"
          end
          
        else
          redirect_to new_lodging_url(:trip_id => @trip.id), :notice => "Please select at least one hotel."
        end
      
    end
end
