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

ActiveRecord::Schema.define(:version => 20130202001123) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.text     "description"
    t.integer  "trip_day_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "budget_cents",    :default => 0,     :null => false
    t.string   "budget_currency", :default => "USD", :null => false
    t.integer  "activity_type"
    t.string   "currency"
  end

  create_table "blogs", :force => true do |t|
    t.integer  "post_count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "components", :force => true do |t|
    t.decimal  "length_in_inches"
    t.decimal  "weight_per_inch"
    t.decimal  "component_weight"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "crossfit_workouts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.integer  "event_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "events", ["event_type_id"], :name => "index_events_on_event_type_id"

  create_table "exercises", :force => true do |t|
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "name"
    t.integer  "exercise_type"
    t.string   "bw_total_weight_moved_1"
    t.string   "bw_total_weight_moved_2"
    t.string   "bw_distance_moved_1"
    t.string   "bw_distance_moved_2"
    t.string   "weight_distance_moved"
    t.string   "bw_work_done_per_rep"
  end

  create_table "expenses", :force => true do |t|
    t.datetime "date"
    t.integer  "category"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "payer"
    t.text     "description"
    t.boolean  "paid"
    t.integer  "amount_cents",    :default => 0,     :null => false
    t.string   "amount_currency", :default => "USD", :null => false
  end

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

  create_table "journal_entries", :force => true do |t|
    t.date     "entry_date"
    t.text     "description"
    t.integer  "purity"
    t.boolean  "lack_of_discipline"
    t.integer  "fitness"
    t.integer  "devotional"
    t.integer  "chrissy"
    t.integer  "relational"
    t.integer  "discipline"
    t.integer  "facepicking"
    t.integer  "stress"
    t.boolean  "sick"
    t.boolean  "flossed"
    t.boolean  "workout"
    t.string   "health_statement"
    t.text     "to_do"
    t.text     "memory_verse"
    t.string   "friends_in_focus"
    t.text     "problem_of_the_day"
    t.boolean  "problem_attempted"
    t.boolean  "problem_solved"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
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

  create_table "posts", :force => true do |t|
    t.text     "body"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "posts_tags", :id => false, :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id", "tag_id"], :name => "index_posts_tags_on_post_id_and_tag_id"

  create_table "principles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reps", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.integer  "count"
    t.float    "seconds"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "distance"
    t.float    "weight"
    t.integer  "exercise_type"
  end

  create_table "sonship_classes", :force => true do |t|
    t.date     "start_date"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sonship_lessons", :force => true do |t|
    t.date     "start_date"
    t.string   "title"
    t.text     "goals"
    t.text     "impact"
    t.text     "memory_verse"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "sonship_class_id"
  end

  create_table "sonship_questions", :force => true do |t|
    t.integer  "sonship_lesson_id"
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.string   "link"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "trip_day_id"
    t.integer  "location_id"
    t.string   "place"
    t.text     "description"
    t.integer  "budget_cents",    :default => 0,     :null => false
    t.string   "budget_currency", :default => "USD", :null => false
    t.string   "currency"
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
    t.decimal  "height_in_inches"
    t.decimal  "weight"
    t.decimal  "neck_weight"
    t.decimal  "torso_weight"
    t.decimal  "pelvis_weight"
    t.decimal  "femur_weight"
    t.decimal  "tibia_weight"
    t.decimal  "ankle_weight"
    t.decimal  "foot_weight"
    t.decimal  "humerus_weight"
    t.decimal  "forearm_weight"
    t.decimal  "hand_weight"
    t.decimal  "neck"
    t.decimal  "torso"
    t.decimal  "pelvis"
    t.decimal  "femur"
    t.decimal  "tibia"
    t.decimal  "ankle"
    t.decimal  "foot"
    t.decimal  "humerus"
    t.decimal  "forearm"
    t.decimal  "hand"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.date     "workout_date"
    t.string   "description"
    t.float    "power"
    t.integer  "crossfit_workout_id"
    t.float    "mileage"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "user_id"
    t.decimal  "total_time"
  end

end
