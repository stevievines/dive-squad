class DiverGoals < ActiveRecord::Migration
  def change
    create_table :diver_goals do |t|
      t.integer :diver_id, null: false
      t.integer :goal_id, null: false
      t.timestamps
    end
    add_index :diver_goals, [:diver_id, :goal_id], unique: true
  end
end
