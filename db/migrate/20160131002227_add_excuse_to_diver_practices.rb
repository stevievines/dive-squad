class AddExcuseToDiverPractices < ActiveRecord::Migration
  def change
    add_column :diver_practices, :excuse, :string
  end
end
