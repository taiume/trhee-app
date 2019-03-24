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

ActiveRecord::Schema.define(version: 20170909053152) do

  create_table "performances", force: :cascade do |t|
    t.date     "day"
    t.integer  "shop_list_id", limit: 4
    t.integer  "wimax",        limit: 4
    t.integer  "uqm",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ym_wifi",      limit: 4
    t.integer  "sb_net",       limit: 4
    t.integer  "sb_wifi",      limit: 4
    t.integer  "au_net",       limit: 4
    t.integer  "au_wifi",      limit: 4
    t.integer  "do_net",       limit: 4
    t.integer  "ym_phone",     limit: 4
    t.integer  "sb_phone",     limit: 4
    t.integer  "au_phone",     limit: 4
    t.integer  "do_phone",     limit: 4
  end

  create_table "shop_lists", force: :cascade do |t|
    t.string "name", limit: 255
  end

end
