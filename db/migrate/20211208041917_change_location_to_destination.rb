class ChangeLocationToDestination < ActiveRecord::Migration[6.1]
  def change
    rename_table :locations, :destinations
    rename_column :bucketlist_locations, :location_id, :destination_id
    rename_column :comments, :location_id, :destination_id
  end
end
