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

ActiveRecord::Schema[7.0].define(version: 2023_09_10_203048) do
  create_table "appointments", force: :cascade do |t|
    t.string "patient_name", default: "", null: false
    t.integer "slot_id"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["slot_id"], name: "index_appointments_on_slot_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer "day", default: 0, null: false
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.integer "duration", default: 60, null: false
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_availabilities_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.integer "status", default: 0, null: false
    t.integer "availability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_slots_on_availability_id"
  end

  add_foreign_key "appointments", "doctors", on_delete: :cascade
  add_foreign_key "appointments", "slots", on_delete: :cascade
  add_foreign_key "availabilities", "doctors", on_delete: :cascade
  add_foreign_key "slots", "availabilities", on_delete: :cascade
end
