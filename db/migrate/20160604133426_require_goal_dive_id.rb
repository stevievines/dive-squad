class RequireGoalDiveId < ActiveRecord::Migration
  def change
    change_column :goals, :dive_id, :integer, null: false
  end
end
