class HotelsController < ApplicationController
    def new
    end
    
    def create
      hotel_list = params[:hotels]
      @trip = Trip.find(params[:trip_id])
      @list = hotel_list.map do |key, value|
        @trip.hotels.create(:name => value)
      end
      @trip.save
      redirect_to new_user_url(:trip_id => @trip.id)
    end
end
