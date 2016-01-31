class AddJoinDateToDivers < ActiveRecord::Migration
  def change
    add_column :divers, :join_date, :datetime
  end
end
