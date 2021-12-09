class CreateLocationComments < ActiveRecord::Migration[6.1]
  def change
    create_table :location_comments do |t|
      t.integer :location_id
      t.string :created_by
      t.timestamps
    end
  end
end
