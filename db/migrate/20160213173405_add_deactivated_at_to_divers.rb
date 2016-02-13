class AddDeactivatedAtToDivers < ActiveRecord::Migration
  def change
    add_column :divers, :deactivated_at, :datetime
  end
end
