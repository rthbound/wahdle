class User < ActiveRecord::Base
  has_secure_password

  has_many :joins  
  has_many :trips, :through => :joins
  has_many :messages
  
  validates_presence_of :email
end
