class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
