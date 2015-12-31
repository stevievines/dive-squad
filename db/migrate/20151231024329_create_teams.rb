class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
    end

    create_table :coaches_teams, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :coach, index: true
    end
  end
end
