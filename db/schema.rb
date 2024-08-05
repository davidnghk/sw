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

ActiveRecord::Schema.define(version: 20181209161302) do

  create_table "correspondents", force: :cascade do |t|
    t.integer  "order_id",     limit: 4
    t.string   "name",         limit: 255
    t.string   "designation",  limit: 255
    t.string   "organization", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "correspondents", ["order_id"], name: "index_correspondents_on_order_id", using: :btree

  create_table "defects", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.string   "chi_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "category",   limit: 255
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.string   "chi_name",      limit: 255
    t.string   "email_address", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "chi_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email_to",   limit: 255
    t.string   "email_cc",   limit: 255
  end

  create_table "items", force: :cascade do |t|
    t.integer  "order_id",           limit: 4
    t.integer  "defect_id",          limit: 4
    t.string   "location",           limit: 255
    t.string   "followup",           limit: 255
    t.date     "due_date"
    t.string   "responsible_person", limit: 255
    t.date     "completion_date"
    t.string   "remarks",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "no",                 limit: 4
  end

  add_index "items", ["defect_id"], name: "index_items_on_defect_id", using: :btree
  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree

  create_table "order_parties", force: :cascade do |t|
    t.integer  "order_id",     limit: 4
    t.string   "name",         limit: 255
    t.string   "designation",  limit: 255
    t.string   "organization", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "order_parties", ["order_id"], name: "index_order_parties_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "issue_id",                  limit: 4
    t.integer  "user_id",                   limit: 4
    t.integer  "district_id",               limit: 4
    t.datetime "booking_datetime"
    t.string   "location",                  limit: 255
    t.string   "user_ref",                  limit: 255
    t.text     "notes",                     limit: 65535
    t.datetime "filing_datetime"
    t.integer  "status",                    limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "order_no",                  limit: 4
    t.integer  "user_ref_no",               limit: 4
    t.string   "staff_name",                limit: 255
    t.date     "staff_signoff_date"
    t.string   "customer_name",             limit: 255
    t.date     "customer_signoff_date"
    t.datetime "staff_signoff_datetime"
    t.datetime "customer_signoff_datetime"
  end

  add_index "orders", ["district_id"], name: "index_orders_on_district_id", using: :btree
  add_index "orders", ["issue_id"], name: "index_orders_on_issue_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "category",       limit: 4
    t.string   "image",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photoable_id",   limit: 4
    t.string   "photoable_type", limit: 255
    t.decimal  "latitude",                   precision: 15, scale: 7
    t.decimal  "longitude",                  precision: 15, scale: 7
    t.decimal  "altitude",                   precision: 15, scale: 7
    t.datetime "photo_datetime"
    t.boolean  "is_printable",                                        default: true
  end

  add_index "photos", ["photoable_id", "photoable_type"], name: "index_photos_on_photoable_id_and_photoable_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                     limit: 255, default: "", null: false
    t.string   "encrypted_password",        limit: 255, default: "", null: false
    t.string   "reset_password_token",      limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",        limit: 255
    t.string   "last_sign_in_ip",           limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                      limit: 255
    t.string   "confirmation_token",        limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",         limit: 255
    t.integer  "role",                      limit: 4
    t.string   "invitation_token",          limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",          limit: 4
    t.integer  "invited_by_id",             limit: 4
    t.string   "invited_by_type",           limit: 255
    t.integer  "invitations_count",         limit: 4,   default: 0
    t.integer  "qualification",             limit: 4
    t.string   "registration_no",           limit: 255
    t.string   "registration_chinese_name", limit: 255
    t.string   "registration_english_name", limit: 255
    t.date     "registration_expiry_date"
    t.string   "aasm_state",                limit: 255
    t.integer  "phone_no",                  limit: 4
    t.string   "username",                  limit: 255
    t.integer  "status",                    limit: 4
    t.string   "provider",                  limit: 255
    t.string   "uid",                       limit: 255
    t.string   "oauth_token",               limit: 255
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "correspondents", "orders"
  add_foreign_key "items", "defects"
  add_foreign_key "items", "orders"
  add_foreign_key "order_parties", "orders"
  add_foreign_key "orders", "districts"
  add_foreign_key "orders", "issues"
  add_foreign_key "orders", "users"
end
