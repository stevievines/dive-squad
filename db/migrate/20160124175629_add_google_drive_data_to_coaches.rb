class AddGoogleDriveDataToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :google_drive_data, :json
  end
end
