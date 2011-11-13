class RemoveGuestListfromTrip < ActiveRecord::Migration
  def up
    remove_column :trips, :guest_list
  end

  def down
  end
end
