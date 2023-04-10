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

ActiveRecord::Schema[7.0].define(version: 2023_03_24_104815) do
  create_table "busdetails", force: :cascade do |t|
    t.string "bus_name"
    t.string "bus_no"
    t.integer "total_seats"
    t.integer "available_seats"
    t.string "start_time"
    t.string "end_time"
    t.integer "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["route_id"], name: "index_busdetails_on_route_id"
    t.index ["user_id"], name: "index_busdetails_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "passenger"
    t.integer "no_of_seat"
    t.string "from"
    t.string "to"
    t.datetime "date_of_journey"
    t.integer "busdetail_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["busdetail_id"], name: "index_reservations_on_busdetail_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.string "user_type"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "owner", default: false
  end

  add_foreign_key "busdetails", "routes"
  add_foreign_key "busdetails", "users"
  add_foreign_key "reservations", "busdetails"
  add_foreign_key "reservations", "users"
end
