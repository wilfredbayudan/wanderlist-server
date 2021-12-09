class CreateBucketlistLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlist_locations do |t|
      t.integer :bucketlist_id
      t.integer :location_id
      t.string :notes
    end
  end
end
