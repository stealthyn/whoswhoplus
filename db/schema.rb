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

ActiveRecord::Schema.define(version: 20140505084532) do

  create_table "access_tokens", force: true do |t|
    t.string   "access_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_tokens", ["access_token"], name: "index_access_tokens_on_access_token", unique: true

  create_table "messages", force: true do |t|
    t.string   "fb_id_from",   null: false
    t.string   "fb_id_to",     null: false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_id_target"
  end

  create_table "profiles", force: true do |t|
    t.integer  "access_token_id"
    t.string   "fb_id",               null: false
    t.string   "name",                null: false
    t.date     "birthday"
    t.string   "gender"
    t.string   "relationship_status"
    t.string   "picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
  end

  add_index "profiles", ["access_token_id"], name: "index_profiles_on_access_token_id", unique: true
  add_index "profiles", ["fb_id"], name: "index_profiles_on_fb_id", unique: true

  create_table "relations", force: true do |t|
    t.string   "fb_id_younger", null: false
    t.string   "fb_id_older",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["fb_id_younger", "fb_id_older"], name: "index_relations_on_fb_id_younger_and_fb_id_older", unique: true

  create_table "templates", force: true do |t|
    t.string   "objective"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
