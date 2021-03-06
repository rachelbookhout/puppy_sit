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

ActiveRecord::Schema.define(version: 20141015201635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "request_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["request_id"], name: "index_comments_on_request_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "requests", force: true do |t|
    t.string   "title",                        null: false
    t.integer  "requester_id",                 null: false
    t.string   "dog_name",                     null: false
    t.text     "body",                         null: false
    t.string   "photo",                        null: false
    t.datetime "start_time",                   null: false
    t.datetime "end_time",                     null: false
    t.string   "address",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pay",                          null: false
    t.boolean  "hourly"
    t.boolean  "weekly"
    t.boolean  "daily"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "reviewed",     default: false
  end

  add_index "requests", ["requester_id"], name: "index_requests_on_requester_id", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "responder_id",                 null: false
    t.integer  "request_id",                   null: false
    t.boolean  "chosen",       default: false, null: false
    t.datetime "timestamps"
  end

  add_index "responses", ["request_id"], name: "index_responses_on_request_id", using: :btree
  add_index "responses", ["responder_id"], name: "index_responses_on_responder_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string  "reviewable_type", null: false
    t.integer "reviewable_id",   null: false
    t.string  "title",           null: false
    t.string  "body",            null: false
    t.integer "rating",          null: false
    t.integer "request_id",      null: false
    t.integer "reviewer_id",     null: false
  end

  add_index "reviews", ["request_id"], name: "index_reviews_on_request_id", using: :btree
  add_index "reviews", ["reviewable_id"], name: "index_reviews_on_reviewable_id", using: :btree
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                              null: false
    t.string   "last_name",                               null: false
    t.string   "profile_photo",                           null: false
    t.integer  "responder_rating"
    t.integer  "requester_rating"
    t.text     "profile"
    t.string   "role",                   default: "user"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
