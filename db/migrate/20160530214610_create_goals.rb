class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :note
      t.references :dive, index: true
      t.references :diver, index: true
      t.timestamps null: false
    end
  end
end
