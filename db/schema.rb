# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_08_042754) do

  create_table "bucketlist_destinations", force: :cascade do |t|
    t.integer "bucketlist_id"
    t.integer "destination_id"
    t.string "notes"
  end

  create_table "bucketlist_tags", force: :cascade do |t|
    t.integer "bucketlist_id"
    t.integer "tag_id"
  end

  create_table "bucketlists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "created_by"
    t.integer "likes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pin"
  end

  create_table "comments", force: :cascade do |t|
    t.string "created_by"
    t.string "comment"
    t.integer "rating", default: 0
    t.integer "bucketlist_id"
    t.integer "destination_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "label"
    t.float "lng"
    t.float "lat"
    t.integer "likes", default: 0
  end

  create_table "tags", force: :cascade do |t|
    t.string "label"
  end

end
