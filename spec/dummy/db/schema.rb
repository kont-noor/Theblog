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

ActiveRecord::Schema.define(version: 20150124095542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "yablog_content_statuses", force: true do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yablog_content_statuses", ["title"], name: "index_yablog_content_statuses_on_title", unique: true, using: :btree

  create_table "yablog_pages", force: true do |t|
    t.string   "title",       null: false
    t.string   "slug",        null: false
    t.text     "description"
    t.text     "body",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yablog_pages", ["slug"], name: "index_yablog_pages_on_slug", unique: true, using: :btree

  create_table "yablog_users", force: true do |t|
    t.string   "user_name",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yablog_users", ["confirmation_token"], name: "index_yablog_users_on_confirmation_token", unique: true, using: :btree
  add_index "yablog_users", ["email"], name: "index_yablog_users_on_email", unique: true, using: :btree
  add_index "yablog_users", ["reset_password_token"], name: "index_yablog_users_on_reset_password_token", unique: true, using: :btree
  add_index "yablog_users", ["user_name"], name: "index_yablog_users_on_user_name", unique: true, using: :btree

end
