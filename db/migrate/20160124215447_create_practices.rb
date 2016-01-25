class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.date :date, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :team_id, null: false
      t.timestamps null: false
    end

    add_index :practices, :team_id
  end
end
