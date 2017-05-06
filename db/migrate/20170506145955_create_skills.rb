class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.belongs_to :fundamental, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
