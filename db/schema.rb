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

ActiveRecord::Schema.define(version: 20180401163107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "role"
    t.integer "points"
    t.integer "results"
    t.bigint "event_id"
    t.bigint "division_id"
    t.index ["division_id"], name: "index_competitions_on_division_id"
    t.index ["event_id"], name: "index_competitions_on_event_id"
  end

  create_table "dancer_competitions", force: :cascade do |t|
    t.bigint "dancer_id"
    t.bigint "competition_id"
    t.index ["competition_id"], name: "index_dancer_competitions_on_competition_id"
    t.index ["dancer_id"], name: "index_dancer_competitions_on_dancer_id"
  end

  create_table "dancers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "ext_id"
    t.integer "wscid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.integer "ext_id"
    t.string "name"
    t.string "abbreviation"
  end

  create_table "event_competitions", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "competition_id"
    t.index ["competition_id"], name: "index_event_competitions_on_competition_id"
    t.index ["event_id"], name: "index_event_competitions_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "ext_id"
    t.string "name"
    t.string "location"
    t.string "url"
    t.string "date"
  end

  create_table "registry_points", force: :cascade do |t|
    t.json "json"
  end

end
