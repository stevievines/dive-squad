class CreateDives < ActiveRecord::Migration
  def change
    create_table :dives do |t|
      t.string :number, null: false
      t.integer :height, null: false
      t.string :description
      t.timestamps null: false
    end

    create_table :list_dives do |t|
      t.belongs_to :list, index: true, null: false
      t.belongs_to :dive, index: true, null: false
    end
  end
end
