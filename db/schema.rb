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

ActiveRecord::Schema.define(version: 20160105015211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaches", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "coaches_teams", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "coach_id"
  end

  add_index "coaches_teams", ["coach_id"], name: "index_coaches_teams_on_coach_id", using: :btree
  add_index "coaches_teams", ["team_id"], name: "index_coaches_teams_on_team_id", using: :btree

  create_table "divers", force: :cascade do |t|
    t.integer  "team_id",    null: false
    t.string   "name",       null: false
    t.date     "birthday"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "divers", ["team_id"], name: "index_divers_on_team_id", using: :btree

  create_table "dives", force: :cascade do |t|
    t.string   "number",      null: false
    t.integer  "height",      null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "list_dives", force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "dive_id", null: false
    t.string  "notes"
  end

  add_index "list_dives", ["dive_id"], name: "index_list_dives_on_dive_id", using: :btree
  add_index "list_dives", ["list_id"], name: "index_list_dives_on_list_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.integer  "diver_id",    null: false
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lists", ["diver_id"], name: "index_lists_on_diver_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
  end

end
