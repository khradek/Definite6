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

ActiveRecord::Schema.define(version: 20160705225846) do

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "event_type"
    t.integer  "script_tag"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "gamecall_tag"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "gamecalls", force: true do |t|
    t.string   "title"
    t.text     "gdata"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "gdata2"
  end

  create_table "plays", force: true do |t|
    t.string   "piece1"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "period1",     default: false, null: false
    t.boolean  "period2",     default: false, null: false
    t.boolean  "period3",     default: false, null: false
    t.boolean  "period4",     default: false, null: false
    t.integer  "priority"
    t.string   "situation1"
    t.string   "situation2"
    t.string   "situation3"
    t.string   "situation4"
    t.string   "situation5"
    t.string   "situation6"
    t.string   "situation7"
    t.string   "situation8"
    t.string   "situation9"
    t.string   "situation10"
    t.string   "play_type"
    t.string   "hash_mark"
    t.string   "piece2"
  end

  add_index "plays", ["event_id"], name: "index_plays_on_event_id"
  add_index "plays", ["user_id"], name: "index_plays_on_user_id"

  create_table "saved_formations", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "priority"
  end

  create_table "saved_plays", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "priority"
  end

  create_table "scripts", force: true do |t|
    t.string   "title"
    t.text     "sdata"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "scripts", ["event_id"], name: "index_scripts_on_event_id"
  add_index "scripts", ["user_id"], name: "index_scripts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
