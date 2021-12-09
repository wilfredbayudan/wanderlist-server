class CreateBucketlistTags < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlist_tags do |t|
      t.integer :bucketlist_id
      t.integer :tag_id
    end
  end
end
