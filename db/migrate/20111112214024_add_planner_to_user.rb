class AddPlannerToUser < ActiveRecord::Migration
  def change
    add_column :users, :planner, :boolean, :default => false
  end
end
