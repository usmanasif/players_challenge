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

ActiveRecord::Schema[7.0].define(version: 2022_02_18_133639) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "modelname", null: false
    t.string "operating_system", null: false
    t.string "os_version", null: false
    t.string "locale", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_devices_on_player_id"
  end

  create_table "offer_targets", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.integer "minimum_age", null: false
    t.integer "maximum_age", null: false
    t.integer "gender", null: false
    t.string "operating_system", null: false
    t.string "minimum_os_version", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_targets_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title", null: false
    t.string "header", null: false
    t.string "description"
    t.integer "points", null: false
    t.decimal "payout", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthdate", null: false
    t.integer "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "devices", "players"
  add_foreign_key "offer_targets", "offers"
end
