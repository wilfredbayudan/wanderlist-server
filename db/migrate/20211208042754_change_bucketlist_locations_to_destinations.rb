class ChangeBucketlistLocationsToDestinations < ActiveRecord::Migration[6.1]
  def change
    rename_table :bucketlist_locations, :bucketlist_destinations
  end
end
