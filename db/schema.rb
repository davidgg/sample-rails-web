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

ActiveRecord::Schema.define(version: 20151206181350) do

  create_table "companies", force: :cascade do |t|
    t.string   "email",                                    null: false
    t.string   "name",                                     null: false
    t.string   "location",          default: "Everywhere"
    t.string   "desc"
    t.string   "website"
    t.boolean  "public_email",      default: false,        null: false
    t.string   "password_digest",                          null: false
    t.string   "salt_front",                               null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "remember_token"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true
  add_index "companies", ["remember_token"], name: "index_companies_on_remember_token"

end
