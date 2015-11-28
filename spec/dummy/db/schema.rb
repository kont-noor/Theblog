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

ActiveRecord::Schema.define(version: 20151212093731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incarnator_accounts", force: :cascade do |t|
    t.string   "user_name",              default: "", null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
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

  add_index "incarnator_accounts", ["confirmation_token"], name: "index_incarnator_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "incarnator_accounts", ["email"], name: "index_incarnator_accounts_on_email", unique: true, using: :btree
  add_index "incarnator_accounts", ["reset_password_token"], name: "index_incarnator_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "incarnator_accounts", ["user_name"], name: "index_incarnator_accounts_on_user_name", unique: true, using: :btree

  create_table "theblog_accounts_roles", force: :cascade do |t|
    t.integer  "account_id", null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "theblog_accounts_roles", ["account_id", "role_id"], name: "index_theblog_accounts_roles_on_account_id_and_role_id", unique: true, using: :btree
  add_index "theblog_accounts_roles", ["account_id"], name: "index_theblog_accounts_roles_on_account_id", using: :btree
  add_index "theblog_accounts_roles", ["role_id"], name: "index_theblog_accounts_roles_on_role_id", using: :btree

  create_table "theblog_content_nodes", force: :cascade do |t|
    t.string   "type",                           null: false
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.text     "body"
    t.string   "tags"
    t.integer  "content_status_id"
    t.integer  "parent_node_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_status",    default: "", null: false
  end

  add_index "theblog_content_nodes", ["author_id"], name: "index_theblog_content_nodes_on_author_id", using: :btree
  add_index "theblog_content_nodes", ["slug"], name: "index_theblog_content_nodes_on_slug", using: :btree
  add_index "theblog_content_nodes", ["title"], name: "index_theblog_content_nodes_on_title", using: :btree
  add_index "theblog_content_nodes", ["type", "slug"], name: "index_theblog_content_nodes_on_type_and_slug", unique: true, using: :btree
  add_index "theblog_content_nodes", ["type"], name: "index_theblog_content_nodes_on_type", using: :btree

  create_table "theblog_content_statuses", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "theblog_content_statuses", ["title"], name: "index_theblog_content_statuses_on_title", unique: true, using: :btree

  create_table "theblog_roles", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "theblog_roles", ["name"], name: "index_theblog_roles_on_name", unique: true, using: :btree

  add_foreign_key "theblog_accounts_roles", "incarnator_accounts", column: "account_id"
  add_foreign_key "theblog_accounts_roles", "theblog_roles", column: "role_id"
  add_foreign_key "theblog_content_nodes", "theblog_content_nodes", column: "parent_node_id"
  add_foreign_key "theblog_content_nodes", "theblog_content_statuses", column: "content_status_id"
end
