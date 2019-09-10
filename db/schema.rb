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

ActiveRecord::Schema.define(version: 2019_09_05_054437) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "health", default: 0
    t.integer "hit", default: 0
    t.integer "experience", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fights", force: :cascade do |t|
    t.integer "player_one_id"
    t.integer "player_two_id"
    t.integer "winner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_one_id"], name: "index_fights_on_player_one_id"
    t.index ["player_two_id"], name: "index_fights_on_player_two_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  add_foreign_key "fights", "characters", column: "player_one_id"
  add_foreign_key "fights", "characters", column: "player_two_id"
  add_foreign_key "fights", "characters", column: "winner_id"
end
