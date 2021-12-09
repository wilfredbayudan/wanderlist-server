class UpdateLikeDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :bucketlists, :likes, :integer, :default => 0
    change_column :locations, :likes, :integer, :default => 0
  end
end
