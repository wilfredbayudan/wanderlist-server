class AddTextComments < ActiveRecord::Migration[6.1]
  def change
    add_column :bucketlist_comments, :comment, :string
    add_column :location_comments, :comment, :string
  end
end
