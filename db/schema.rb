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

ActiveRecord::Schema.define(version: 20151105164101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
    t.string   "specialty"
  end

  create_table "doses", force: :cascade do |t|
    t.integer  "amount_of_pills_taken"
    t.integer  "pain_scale"
    t.string   "qualitative_description_of_current_pain"
    t.time     "time_taken"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "prescription_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "insurer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "initial_amount_of_pills"
    t.integer  "length_of_prescription"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "max_dose_amount"
    t.string   "purpose"
    t.string   "instructions"
    t.integer  "doses_per_day"
    t.string   "drug_name"
  end

  create_table "reportable_cache", force: :cascade do |t|
    t.string   "model_class_name", limit: 100,               null: false
    t.string   "report_name",      limit: 100,               null: false
    t.string   "grouping",         limit: 10,                null: false
    t.string   "aggregation",      limit: 10,                null: false
    t.string   "conditions",       limit: 100,               null: false
    t.float    "value",                        default: 0.0, null: false
    t.datetime "reporting_period",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reportable_cache", ["model_class_name", "report_name", "grouping", "aggregation", "conditions", "reporting_period"], name: "name_model_grouping_aggregation_period", unique: true, using: :btree
  add_index "reportable_cache", ["model_class_name", "report_name", "grouping", "aggregation", "conditions"], name: "name_model_grouping_agregation", using: :btree

  create_table "visits", force: :cascade do |t|
    t.time     "time"
    t.date     "date"
    t.string   "reason"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
