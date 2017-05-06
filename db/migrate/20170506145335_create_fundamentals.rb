class CreateFundamentals < ActiveRecord::Migration
  def change
    create_table :fundamentals do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
