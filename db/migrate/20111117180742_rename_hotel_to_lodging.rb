class RenameLodgingToLodging < ActiveRecord::Migration
  def change
      rename_table :lodgings, :lodgings
  end
end
