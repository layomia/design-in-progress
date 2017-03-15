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

ActiveRecord::Schema.define(version: 20170315030046) do

  create_table "dips", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "#<ActiveRecord::ConnectionAdapters::TableDefinition:0x00000003318550>"
    t.string   "name"
    t.integer  "user_id"
  end

  create_table "dips_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dip_id"
  end

  add_index "dips_users", ["dip_id"], name: "index_dips_users_on_dip_id"
  add_index "dips_users", ["user_id"], name: "index_dips_users_on_user_id"

  create_table "steps", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dip_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "major"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified_email",      default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
