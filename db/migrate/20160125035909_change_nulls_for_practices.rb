class ChangeNullsForPractices < ActiveRecord::Migration
  def change
    remove_column :practices, :start_time, :datetime
    remove_column :practices, :end_time, :datetime
  end
end
