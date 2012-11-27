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

ActiveRecord::Schema.define(:version => 20121127003211) do

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.integer  "time_slot_id"
    t.integer  "event_type_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "events", ["event_type_id"], :name => "index_events_on_event_type_id"
  add_index "events", ["time_slot_id"], :name => "index_events_on_time_slot_id"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "family_goals", :force => true do |t|
    t.string   "name"
    t.integer  "priority"
    t.boolean  "above_cut"
    t.text     "description"
    t.text     "justification"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "goals", :force => true do |t|
    t.string   "name"
    t.date     "due_date"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "lost_items", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.date     "date_lost"
    t.text     "description"
    t.integer  "priority"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "lost_items", ["user_id"], :name => "index_lost_items_on_user_id"

  create_table "principles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "time_slots", :force => true do |t|
    t.string   "title"
    t.integer  "event_type_id"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.integer  "user_id"
    t.time     "starts_at"
    t.time     "ends_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "time_slots", ["event_type_id"], :name => "index_time_slots_on_event_type_id"
  add_index "time_slots", ["user_id"], :name => "index_time_slots_on_user_id"

  create_table "trip_days", :force => true do |t|
    t.date     "day_date"
    t.string   "lodging"
    t.string   "lodging_link"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "trip_id"
    t.integer  "location_id"
    t.string   "goal"
    t.text     "notes"
  end

  add_index "trip_days", ["location_id"], :name => "index_trip_days_on_location_id"
  add_index "trip_days", ["trip_id"], :name => "index_trip_days_on_trip_id"

  create_table "trip_meals", :force => true do |t|
    t.integer  "meal"
    t.string   "location"
    t.string   "link"
    t.integer  "budget"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "trip_day_id"
    t.integer  "location_id"
    t.string   "place"
    t.text     "description"
  end

  add_index "trip_meals", ["location_id"], :name => "index_trip_meals_on_location_id"
  add_index "trip_meals", ["trip_day_id"], :name => "index_trip_meals_on_trip_day_id"

  create_table "trips", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.integer  "budget"
    t.integer  "total_cost"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
