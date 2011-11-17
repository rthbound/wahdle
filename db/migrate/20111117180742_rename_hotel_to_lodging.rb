class RenameHotelToLodging < ActiveRecord::Migration
  def change
      rename_table :hotels, :lodgings
  end
end
