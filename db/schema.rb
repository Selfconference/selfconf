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

ActiveRecord::Schema.define(version: 20150228175927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "twitter"
    t.string   "lanyard"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_organizers", id: false, force: :cascade do |t|
    t.integer "events_id"
    t.integer "organizers_id"
  end

  add_index "events_organizers", ["events_id"], name: "index_events_organizers_on_events_id", using: :btree
  add_index "events_organizers", ["organizers_id"], name: "index_events_organizers_on_organizers_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "email"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id_id"
    t.integer  "venue_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "name"
    t.text     "abstract"
    t.boolean  "keynote"
    t.integer  "event_id_id"
    t.integer  "room_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions_speakers", id: false, force: :cascade do |t|
    t.integer "sessions_id"
    t.integer "speakers_id"
  end

  add_index "sessions_speakers", ["sessions_id"], name: "index_sessions_speakers_on_sessions_id", using: :btree
  add_index "sessions_speakers", ["speakers_id"], name: "index_sessions_speakers_on_speakers_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.string   "twitter"
    t.text     "bio"
    t.string   "photo"
    t.integer  "event_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsor_levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "photo"
    t.integer  "event_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors_sponsor_levels", id: false, force: :cascade do |t|
    t.integer "sponsors_id"
    t.integer "sponsor_levels_id"
  end

  add_index "sponsors_sponsor_levels", ["sponsor_levels_id"], name: "index_sponsors_sponsor_levels_on_sponsor_levels_id", using: :btree
  add_index "sponsors_sponsor_levels", ["sponsors_id"], name: "index_sponsors_sponsor_levels_on_sponsors_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "maps_link"
    t.integer  "events_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
