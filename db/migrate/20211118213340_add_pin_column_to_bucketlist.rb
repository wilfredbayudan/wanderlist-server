class AddPinColumnToBucketlist < ActiveRecord::Migration[6.1]
  def change
    add_column :bucketlists, :pin, :string
  end
end
