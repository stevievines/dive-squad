class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.string :name, null: false
      t.integer :progression, null: false
      t.belongs_to :skill, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
