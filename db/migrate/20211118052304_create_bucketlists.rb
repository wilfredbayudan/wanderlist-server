class CreateBucketlists < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlists do |t|
      t.string :name
      t.string :description
      t.string :created_by
      t.integer :likes
      t.timestamps
    end
  end
end
