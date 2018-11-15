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

ActiveRecord::Schema.define(version: 2018_06_02_013124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "venue_id"
    t.string "name"
    t.text "about"
    t.string "twitter"
    t.string "lanyard"
    t.string "tickets_link"
    t.string "tickets_iframe_link"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "extra"
    t.string "url"
    t.string "ga_tracking_id"
    t.string "tito_name"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "events_organizers", id: false, force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "organizer_id"
    t.index ["event_id"], name: "index_events_organizers_on_event_id"
    t.index ["organizer_id"], name: "index_events_organizers_on_organizer_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "vote"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "session_id"
  end

  create_table "funding_meters", force: :cascade do |t|
    t.bigint "event_id"
    t.float "current"
    t.float "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_funding_meters_on_event_id"
  end

  create_table "metric_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metrics", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "metric_type_id"
    t.string "name"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_metrics_on_event_id"
    t.index ["metric_type_id"], name: "index_metrics_on_metric_type_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "email"
    t.string "twitter"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_speakers", force: :cascade do |t|
    t.bigint "speaker_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_speakers_on_role_id"
    t.index ["speaker_id"], name: "index_roles_speakers_on_speaker_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["event_id"], name: "index_rooms_on_event_id"
    t.index ["venue_id"], name: "index_rooms_on_venue_id"
  end

  create_table "scholarship_applications", force: :cascade do |t|
    t.bigint "event_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "location"
    t.string "groups"
    t.boolean "needs_help_with_tickets"
    t.boolean "needs_help_with_travel"
    t.boolean "needs_help_with_other"
    t.text "financial_need_explanation"
    t.text "why_attend"
    t.text "special_accomodations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_scholarship_applications_on_event_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "name", null: false
    t.string "abstract"
    t.string "talktype", null: false
    t.string "notes"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selected", default: false, null: false
    t.integer "room_id"
    t.integer "slot_id"
    t.boolean "keynote", default: false, null: false
    t.index ["event_id"], name: "index_sessions_on_event_id"
  end

  create_table "sessions_speakers", id: false, force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "speaker_id"
    t.index ["session_id"], name: "index_sessions_speakers_on_session_id"
    t.index ["speaker_id"], name: "index_sessions_speakers_on_speaker_id"
  end

  create_table "slots", force: :cascade do |t|
    t.bigint "event_id"
    t.datetime "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_time"
    t.index ["event_id"], name: "index_slots_on_event_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "twitter"
    t.text "bio", null: false
    t.string "headshot", null: false
    t.string "encrypted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_speakers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_speakers_on_reset_password_token", unique: true
  end

  create_table "sponsor_levels", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["event_id"], name: "index_sponsor_levels_on_event_id"
  end

  create_table "sponsor_levels_sponsors", id: false, force: :cascade do |t|
    t.bigint "sponsor_id"
    t.bigint "sponsor_level_id"
    t.index ["sponsor_id"], name: "index_sponsor_levels_sponsors_on_sponsor_id"
    t.index ["sponsor_level_id"], name: "index_sponsor_levels_sponsors_on_sponsor_level_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "photo"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sponsors_on_event_id"
  end

  create_table "timeline_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.datetime "when"
    t.bigint "event_id"
    t.integer "timeline_type_id", null: false
    t.index ["event_id"], name: "index_timelines_on_event_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "maps_link"
    t.string "address"
    t.bigint "events_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reservation"
    t.index ["events_id"], name: "index_venues_on_events_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "value"
    t.bigint "speaker_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_votes_on_session_id"
    t.index ["speaker_id"], name: "index_votes_on_speaker_id"
  end

end
