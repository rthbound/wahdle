class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :user_id
      t.integer :trip_id
      t.boolean  :planner,  :default => false
      t.timestamps
    end
  end
end
