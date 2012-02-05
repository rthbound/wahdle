class Trip < ActiveRecord::Base
  
  has_many :joins
  has_many :users, :through => :joins
  has_many :lodgings
  
  has_many :messages
  
  
  def planner
   # User.find(self.joins.find_by_planner(true).user_id)
    Trip.includes(:users).where("joins.planner = ?", true).find(self).users.first
  end
  
  def guests
    Trip.includes(:users).where("joins.planner = ?", false).find(self).users
  end

end
