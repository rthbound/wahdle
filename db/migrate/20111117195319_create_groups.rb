class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :planner_id
      t.integer :lodging_id

      t.timestamps
    end
  end
end
