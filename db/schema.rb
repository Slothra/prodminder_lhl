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

ActiveRecord::Schema.define(version: 20150228153500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "health_authority"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configs", force: :cascade do |t|
    t.integer "site_id"
    t.string  "property"
    t.string  "value"
    t.text    "description"
  end

  create_table "reminders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "screening_id"
    t.datetime "last_reminder"
    t.datetime "next_reminder"
  end

  create_table "screenings", force: :cascade do |t|
    t.string  "name"
    t.string  "condition_id"
    t.string  "gender"
    t.integer "min_18_24"
    t.integer "max_18_24"
    t.integer "min_25_29"
    t.integer "max_25_29"
    t.integer "min_30_39"
    t.integer "max_30_39"
    t.integer "min_40_49"
    t.integer "max_40_49"
    t.integer "min_50_59"
    t.integer "max_50_59"
    t.integer "min_60_69"
    t.integer "max_60_69"
    t.integer "min_70_up"
    t.integer "max_70_up"
  end

  create_table "sessions", force: :cascade do |t|
    t.boolean  "logged_in"
    t.integer  "user_id"
    t.string   "hash1"
    t.string   "hash2"
    t.string   "hash3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "gender"
    t.string   "email"
    t.string   "phone"
    t.datetime "actived_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
  end

end
