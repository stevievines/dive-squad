class MakeGoalDiveIdUnique < ActiveRecord::Migration
  def change
    remove_index :goals, :dive_id
    add_index :goals, :dive_id, unique: true
  end
end
