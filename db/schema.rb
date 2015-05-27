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

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "role_subgroups", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "subgroup_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "view_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "subgroups", force: :cascade do |t|
    t.integer "group_id"
    t.string  "name"
  end

  add_index "subgroups", ["name"], name: "index_subgroups_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

  create_table "view_groups", force: :cascade do |t|
    t.integer "view_id"
    t.integer "group_id"
  end

  create_table "views", force: :cascade do |t|
    t.string "name"
  end

  add_index "views", ["name"], name: "index_views_on_name", unique: true, using: :btree

end
