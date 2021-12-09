class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :label
      t.float :lng
      t.float :lat
      t.integer :likes
    end
  end
end
