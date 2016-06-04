class RemoveDiverIdFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :diver_id, :integer
    remove_column :goals, :note, :text
  end
end
