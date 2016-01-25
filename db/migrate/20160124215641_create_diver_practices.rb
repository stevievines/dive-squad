class CreateDiverPractices < ActiveRecord::Migration
  def change
    create_table :diver_practices do |t|
      t.boolean :was_present, default: true, null: false
      t.boolean :excused_absence
      t.integer :minutes_late
      t.integer :diver_id, null: false
      t.integer :practice_id, null: false
      t.timestamps null: false
    end

    add_index :diver_practices, :diver_id
    add_index :diver_practices, :practice_id
  end
end
