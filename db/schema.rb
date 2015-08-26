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

ActiveRecord::Schema.define(version: 20150808120920) do

  create_table "administrators", id: false, force: :cascade do |t|
    t.integer  "master_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "administrators", ["master_id", "user_id"], name: "index_administrators_on_master_id_and_user_id", using: :btree

  create_table "authors", id: false, force: :cascade do |t|
    t.integer  "master_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "authors", ["master_id", "user_id"], name: "index_authors_on_master_id_and_user_id", using: :btree

  create_table "masters", force: :cascade do |t|
    t.string   "url",        limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sites", force: :cascade do |t|
    t.integer  "master_id",        limit: 4
    t.string   "headline_title",   limit: 255
    t.string   "headline_text",    limit: 255
    t.string   "bg_img_file_name", limit: 255
    t.string   "bg_text",          limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_registers", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "organization",    limit: 255
    t.string   "country",         limit: 255
    t.string   "token",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.boolean  "active",          limit: 1,   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "organization",    limit: 255
    t.string   "country",         limit: 255
  end

end
