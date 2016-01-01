class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :diver, index: true, null: false
      t.string :name, null: false
      t.string :description
      t.timestamps null: false
    end
  end
end
