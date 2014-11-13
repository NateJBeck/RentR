# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141112221636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_requests", force: true do |t|
    t.date     "starts_on"
    t.date     "ends_on"
    t.integer  "guest_number"
    t.integer  "listing_id",   null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "images", force: true do |t|
    t.string   "url"
    t.text     "title"
    t.integer  "listing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["listing_id"], name: "index_images_on_listing_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "listing_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["listing_id", "user_id"], name: "index_likes_on_listing_id_and_user_id", unique: true, using: :btree

  create_table "listings", force: true do |t|
    t.string   "title"
    t.integer  "price"
    t.string   "location"
    t.integer  "bedrooms"
    t.date     "starts_on"
    t.date     "ends_on"
    t.text     "description"
    t.integer  "user_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "max_guest_number", default: 1
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info"
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
