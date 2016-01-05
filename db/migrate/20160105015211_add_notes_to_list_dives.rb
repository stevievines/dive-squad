class AddNotesToListDives < ActiveRecord::Migration
  def change
    add_column :list_dives, :notes, :string
  end
end
