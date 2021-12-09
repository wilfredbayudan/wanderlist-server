class RefactorComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :bucketlist_comments
    drop_table :location_comments
    create_table :comments do |t|
      t.string :created_by
      t.string :comment
      t.integer :rating, :default => 0
      t.integer :bucketlist_id
      t.integer :location_id
      t.timestamps
    end
  end
end
