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

ActiveRecord::Schema.define(version: 20150629084714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name",    null: false
    t.string   "middle_name"
    t.string   "last_name",     null: false
    t.date     "date_of_birth"
    t.string   "type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "accounts", ["first_name"], name: "index_accounts_on_first_name", using: :btree
  add_index "accounts", ["last_name"], name: "index_accounts_on_last_name", using: :btree
  add_index "accounts", ["middle_name"], name: "index_accounts_on_middle_name", using: :btree

  create_table "incarnator_accounts", force: :cascade do |t|
    t.string   "user_name",              limit: 255, default: "", null: false
    t.string   "first_name",             limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incarnator_accounts", ["confirmation_token"], name: "index_incarnator_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "incarnator_accounts", ["email"], name: "index_incarnator_accounts_on_email", unique: true, using: :btree
  add_index "incarnator_accounts", ["reset_password_token"], name: "index_incarnator_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "incarnator_accounts", ["user_name"], name: "index_incarnator_accounts_on_user_name", unique: true, using: :btree

  create_table "yablog_content_nodes", force: :cascade do |t|
    t.string   "type",              limit: 255, null: false
    t.string   "title",             limit: 255, null: false
    t.string   "slug",              limit: 255, null: false
    t.text     "description"
    t.text     "body"
    t.string   "tags",              limit: 255
    t.integer  "content_status_id"
    t.integer  "parent_node_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yablog_content_nodes", ["slug"], name: "index_yablog_content_nodes_on_slug", using: :btree
  add_index "yablog_content_nodes", ["title"], name: "index_yablog_content_nodes_on_title", using: :btree
  add_index "yablog_content_nodes", ["type", "slug"], name: "index_yablog_content_nodes_on_type_and_slug", unique: true, using: :btree
  add_index "yablog_content_nodes", ["type"], name: "index_yablog_content_nodes_on_type", using: :btree

  create_table "yablog_content_statuses", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yablog_content_statuses", ["title"], name: "index_yablog_content_statuses_on_title", unique: true, using: :btree

  create_table "yablog_users", force: :cascade do |t|
    t.string   "user_name",              limit: 255,             null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255,             null: false
    t.string   "encrypted_password",     limit: 255,             null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yablog_users", ["confirmation_token"], name: "index_yablog_users_on_confirmation_token", unique: true, using: :btree
  add_index "yablog_users", ["email"], name: "index_yablog_users_on_email", unique: true, using: :btree
  add_index "yablog_users", ["reset_password_token"], name: "index_yablog_users_on_reset_password_token", unique: true, using: :btree
  add_index "yablog_users", ["user_name"], name: "index_yablog_users_on_user_name", unique: true, using: :btree

  add_foreign_key "yablog_content_nodes", "yablog_content_nodes", column: "parent_node_id", name: "yablog_content_nodes_parent_node_id_fk"
  add_foreign_key "yablog_content_nodes", "yablog_content_statuses", column: "content_status_id", name: "yablog_content_nodes_content_status_id_fk"
end
