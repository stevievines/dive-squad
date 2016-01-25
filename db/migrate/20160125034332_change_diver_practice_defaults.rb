class ChangeDiverPracticeDefaults < ActiveRecord::Migration
  def up
    change_column :diver_practices, :was_present, :boolean, null: true
    change_column_default :diver_practices, :was_present, false
  end

  def down
    change_column :diver_practices, :was_present, :boolean, null: false
    change_column_default :diver_practices, :was_present, true
  end
end
