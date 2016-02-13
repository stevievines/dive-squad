class AddDeactivationReasonToDivers < ActiveRecord::Migration
  def change
    add_column :divers, :deactivation_reason, :string
  end
end
