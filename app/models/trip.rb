class Trip < ActiveRecord::Base
  
  has_many :joins
  has_many :users, :through => :joins
  has_many :lodgings
  
  has_many :messages
end
