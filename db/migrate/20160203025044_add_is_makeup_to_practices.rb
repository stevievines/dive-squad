class AddIsMakeupToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :is_makeup, :boolean, default: false
  end
end
