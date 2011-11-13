class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.string :starts_on
      t.string :ends_on
      t.text :guest_list

      t.timestamps
    end
  end
end
