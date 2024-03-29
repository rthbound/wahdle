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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111117195856) do

  create_table "destinations", :force => true do |t|
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "planner_id"
    t.integer  "lodging_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "joins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.boolean  "planner",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lodgings", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "ean_hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.string   "destination"
    t.string   "starts_on"
    t.string   "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lodging_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "planner",         :default => false
    t.integer  "group_id"
  end

end
