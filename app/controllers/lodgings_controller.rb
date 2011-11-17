class LodgingsController < ApplicationController
    def new
    end
    
    def create
      lodging_list = params[:lodgings]
      @trip = Trip.find(params[:trip_id])
      @list = lodging_list.map do |key, value|
        @trip.lodgings.create(:name => value)
      end
      @trip.save
      redirect_to new_user_url(:trip_id => @trip.id)
    end
end
