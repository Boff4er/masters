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

ActiveRecord::Schema.define(version: 20161231065803) do

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "cat_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "public",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audiodialogs", force: true do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audiomessages", force: true do |t|
    t.integer  "to_user"
    t.integer  "from_user"
    t.integer  "task_id"
    t.text     "description"
    t.string   "audio"
    t.boolean  "read",           default: false
    t.boolean  "public",         default: false
    t.integer  "order_id"
    t.integer  "audiodialog_id"
    t.boolean  "read_master",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audios", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cats", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.integer  "parent_id"
    t.integer  "level"
    t.integer  "count"
    t.integer  "ord",         default: 0
    t.boolean  "public",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dialogs", force: true do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favtasks", force: true do |t|
    t.integer  "profile_id"
    t.string   "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favusers", force: true do |t|
    t.integer  "profile_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "photo"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "to_user"
    t.integer  "from_user"
    t.integer  "task_id"
    t.text     "description"
    t.boolean  "read",        default: false
    t.boolean  "public",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "dialog_id"
    t.boolean  "read_master", default: false
  end

  create_table "orders", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "userdo_id"
    t.string   "status"
    t.boolean  "work",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.float    "price"
    t.string   "ltime"
    t.boolean  "read",        default: false
    t.boolean  "read_master", default: false
  end

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.integer  "user_id"
    t.integer  "cat_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "who_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rayons", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recalls", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "from_user_id"
    t.text     "description"
    t.boolean  "question1",    default: false
    t.boolean  "question2",    default: false
    t.boolean  "question3",    default: false
    t.boolean  "question4",    default: false
    t.boolean  "question5",    default: false
    t.boolean  "question6",    default: false
    t.boolean  "question7",    default: false
    t.boolean  "question8",    default: false
    t.boolean  "question9",    default: false
    t.boolean  "question10",   default: false
    t.integer  "rating"
    t.boolean  "isgoood",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "tasks", force: true do |t|
    t.integer  "cat_id"
    t.string   "name"
    t.text     "map"
    t.integer  "view"
    t.integer  "user_count"
    t.float    "price1"
    t.float    "price2"
    t.string   "from1"
    t.string   "from2"
    t.datetime "time1"
    t.datetime "time2"
    t.text     "description"
    t.boolean  "read",         default: false
    t.boolean  "public",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cat"
    t.integer  "cat_sub"
    t.string   "file_image"
    t.integer  "budget"
    t.float    "price_fix"
    t.float    "price_1"
    t.float    "price_2"
    t.integer  "time_type"
    t.date     "date_aktual"
    t.integer  "date_count"
    t.date     "date_start"
    t.date     "date_stop"
    t.integer  "user_id"
    t.string   "city_from"
    t.string   "address_from"
    t.string   "house_from"
    t.string   "kv_from"
    t.string   "city_to"
    t.string   "address_to"
    t.string   "house_to"
    t.string   "kv_to"
    t.integer  "userdo_id"
    t.boolean  "inwork",       default: false
    t.boolean  "done",         default: false
    t.boolean  "finish",       default: false
    t.string   "ptype"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.float    "value"
    t.string   "status"
    t.boolean  "done",       default: false
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uarticles", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "name1"
    t.string   "name2"
    t.string   "name3"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address"
    t.string   "rating"
    t.string   "city"
    t.string   "opyt"
    t.string   "auto"
    t.string   "garant1"
    t.string   "garant2"
    t.string   "learn1"
    t.string   "learn2"
    t.string   "learn3"
    t.integer  "tasks"
    t.integer  "plus"
    t.integer  "minus"
    t.boolean  "public",                 default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "image"
    t.float    "price"
    t.text     "description"
    t.text     "cats"
    t.string   "skype"
    t.string   "www"
    t.text     "garants"
    t.text     "pays"
    t.string   "location"
    t.text     "raions"
    t.text     "photo"
    t.boolean  "ismaster"
    t.boolean  "ismasterfull"
    t.text     "status"
    t.integer  "b_date"
    t.integer  "b_month"
    t.integer  "b_year"
    t.string   "default_profile",        default: "user"
    t.float    "balance"
    t.datetime "last_seen"
    t.string   "ptype"
    t.integer  "order"
    t.string   "url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
