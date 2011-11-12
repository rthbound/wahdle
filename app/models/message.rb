class Message < ActiveRecord::Base
  belongs_to :user
  
  scope "created_at desc"
end
