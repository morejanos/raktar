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

ActiveRecord::Schema.define(version: 20170610194239) do

  create_table "components", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "partnumber",         limit: 255
    t.integer  "inventory",          limit: 4
    t.string   "inductivity",        limit: 255
    t.string   "power",              limit: 255
    t.string   "voltage",            limit: 255
    t.string   "current",            limit: 255
    t.string   "resistance",         limit: 255
    t.string   "dimension",          limit: 255
    t.string   "temperature",        limit: 255
    t.string   "capacity",           limit: 255
    t.string   "location",           limit: 255
    t.string   "comment",            limit: 255
    t.integer  "criticalNrOfPieces", limit: 4
    t.integer  "packaging_id",       limit: 4
    t.integer  "manufacturer_id",    limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "componenttype_id",   limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "status_id",          limit: 4
  end

  add_index "components", ["status_id"], name: "index_components_on_status_id", using: :btree

  create_table "componenttypes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "contactPerson", limit: 255
    t.string   "address",       limit: 255
    t.string   "email",         limit: 255
    t.string   "phone",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "packagings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name",        limit: 255
    t.string "description", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "permission_id",          limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "components", "statuses"
end
