# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_10_020021) do

  create_table "comments", force: :cascade do |t|
    t.string "comment_text"
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.integer "zip_code"
    t.text "contact_info"
    t.text "accessibility"
    t.text "site_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "site_windows_count", default: 0
  end

  create_table "user_comments", force: :cascade do |t|
    t.string "comment_text"
    t.integer "user_id"
    t.integer "site_id"
    t.integer "window_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "site_admin", default: false
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "windows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "site_id"
    t.string "name"
    t.integer "year_created"
    t.text "dedication"
    t.text "window_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "windows_count", default: 0
  end

end
