class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :destination_id
      t.string :starts_on
      t.string :ends_on
      t.text :guest_list

      t.timestamps
    end
  end
end
