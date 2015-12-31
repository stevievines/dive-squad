class CreateDivers < ActiveRecord::Migration
  def change
    create_table :divers do |t|
      t.integer :team_id, null: false
      t.string :name, null: false
      t.date :birthday
      t.string :email
      t.string :phone
      t.timestamps null: false
    end

    add_index :divers, :team_id
  end
end
