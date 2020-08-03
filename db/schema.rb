# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_14_234312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "animal_type"
    t.string "name"
    t.integer "external_id"
    t.text "description"
    t.string "age"
    t.string "gender"
    t.integer "shelter_id"
    t.integer "canvas_photo_id"
    t.integer "profile_photo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.hstore "address"
    t.string "name"
    t.integer "max_paintings"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paint_locations", force: :cascade do |t|
    t.hstore "address"
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paintings", force: :cascade do |t|
    t.integer "animal_id"
    t.integer "paint_location_id"
    t.integer "gallery_id"
    t.string "painting_url"
    t.string "painting_status"
    t.string "painter"
    t.integer "card_stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "animal_id"
    t.string "original_url"
    t.string "size"
    t.string "file_path"
    t.string "google_drive_url"
    t.boolean "bkgd_removed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shelters", force: :cascade do |t|
    t.string "external_id"
    t.string "name"
    t.hstore "address"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.integer "permission_level", default: 1
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
