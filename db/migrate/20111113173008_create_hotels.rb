class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.string :name
      t.integer :trip_id

      t.timestamps
    end
  end
end
