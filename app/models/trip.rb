class Trip < ActiveRecord::Base
  belongs_to :destination
  
  has_many :joins
  has_many :users, :through => :joins
end
