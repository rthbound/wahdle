class Lodging < ActiveRecord::Base
  
  belongs_to :trip 
  
  validates_uniqueness_of :ean_hotel_id, :scope => :trip_id
end
