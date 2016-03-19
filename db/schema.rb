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

ActiveRecord::Schema.define(version: 20160319215832) do

  create_table "airlines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airplanes", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "airline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "seats"
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "flight_id"
    t.integer  "no_of_passenger"
    t.integer  "confirmation_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.date     "dept_date"
    t.string   "dept_time"
    t.string   "flight_code"
    t.string   "price"
    t.integer  "airplane_id"
    t.string   "duration"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
