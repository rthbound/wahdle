class Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  belongs_to :hotel
end
