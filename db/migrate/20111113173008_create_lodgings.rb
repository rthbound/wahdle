class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.integer :trip_id
      t.integer :ean_hotel_id
      t.timestamps
    end
  end
end
