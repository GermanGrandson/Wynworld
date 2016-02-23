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

ActiveRecord::Schema.define(version: 20160223201747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.date     "graddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "description"
    t.string   "website"
    t.boolean  "hp"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "orgtype"
    t.string   "street1"
    t.string   "street2"
    t.integer  "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "contact_first"
    t.string   "contact_last"
    t.text     "note"
    t.string   "contact_email"
    t.string   "tech_contact_f"
    t.string   "tech_contact_l"
    t.string   "tech_email"
    t.string   "contact_phone"
  end

  create_table "employments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "jobtitle",   default: ""
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "roletype"
    t.string   "rolenature"
    t.string   "rolesource"
    t.integer  "salary"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",    default: false
  end

  add_index "employments", ["company_id"], name: "index_employments_on_company_id", using: :btree
  add_index "employments", ["user_id"], name: "index_employments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "role"
    t.string   "fname"
    t.string   "lname"
    t.integer  "cohort_id",              default: 1
    t.string   "location"
    t.hstore   "status",                 default: {},    null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "picurl"
    t.hstore   "social_links",           default: {},    null: false
    t.string   "avatar"
  end

  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :gist

  add_foreign_key "employments", "companies"
  add_foreign_key "employments", "users"
  add_foreign_key "users", "cohorts"
end