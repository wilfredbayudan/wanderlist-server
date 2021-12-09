class CreateBucketlistComments < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlist_comments do |t|
      t.integer :bucketlist_id
      t.string :created_by
      t.timestamps
    end
  end
end
