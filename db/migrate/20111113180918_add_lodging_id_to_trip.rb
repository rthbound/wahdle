class AddLodgingIdToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :lodging_id, :integer
  end
end
