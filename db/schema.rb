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

ActiveRecord::Schema.define(version: 20160119165408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "name"
    t.text     "about"
    t.string   "twitter"
    t.string   "lanyard"
    t.string   "tickets_link"
    t.string   "tickets_iframe_link"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "extra"
    t.boolean  "sessions_published"
    t.datetime "submissions_start"
    t.datetime "submissions_end"
  end

  create_table "events_organizers", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "organizer_id"
  end

  add_index "events_organizers", ["event_id"], name: "index_events_organizers_on_event_id", using: :btree
  add_index "events_organizers", ["organizer_id"], name: "index_events_organizers_on_organizer_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "session_id"
    t.integer  "vote"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funding_meters", force: :cascade do |t|
    t.integer  "event_id"
    t.float    "current"
    t.float    "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "email"
    t.string   "twitter"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scholarship_applications", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.string   "groups"
    t.boolean  "needs_help_with_tickets"
    t.boolean  "needs_help_with_travel"
    t.boolean  "needs_help_with_other"
    t.text     "financial_need_explanation"
    t.text     "why_attend"
    t.text     "special_accomodations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "name"
    t.text     "abstract"
    t.boolean  "keynote"
    t.integer  "event_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "slot"
  end

  create_table "sessions_speakers", id: false, force: :cascade do |t|
    t.integer "session_id"
    t.integer "speaker_id"
  end

  add_index "sessions_speakers", ["session_id"], name: "index_sessions_speakers_on_session_id", using: :btree
  add_index "sessions_speakers", ["speaker_id"], name: "index_sessions_speakers_on_speaker_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.string   "twitter"
    t.text     "bio"
    t.string   "photo"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsor_levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "sponsor_levels_sponsors", id: false, force: :cascade do |t|
    t.integer "sponsor_id"
    t.integer "sponsor_level_id"
  end

  add_index "sponsor_levels_sponsors", ["sponsor_id"], name: "index_sponsor_levels_sponsors_on_sponsor_id", using: :btree
  add_index "sponsor_levels_sponsors", ["sponsor_level_id"], name: "index_sponsor_levels_sponsors_on_sponsor_level_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "photo"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: :cascade do |t|
    t.string   "talkname",   null: false
    t.text     "abstract",   null: false
    t.string   "talktype",   null: false
    t.string   "notes"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timelines", force: :cascade do |t|
    t.datetime "when"
    t.string   "what"
    t.integer  "event_id"
  end

  add_index "timelines", ["event_id"], name: "index_timelines_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "email",                                  null: false
    t.string   "twitter"
    t.text     "bio",                                    null: false
    t.string   "headshot",                               null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "encrypted_password",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "maps_link"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
