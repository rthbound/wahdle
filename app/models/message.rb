class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :group
  
  default_scope :order => "created_at DESC"
end
