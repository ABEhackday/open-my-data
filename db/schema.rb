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

ActiveRecord::Schema.define(version: 20131102024111) do

  create_table "dataset_data", force: true do |t|
    t.integer  "dataset_field_id_id"
    t.integer  "dataset_row_id_id"
    t.string   "dataset_field_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dataset_data", ["dataset_field_id_id"], name: "index_dataset_data_on_dataset_field_id_id"
  add_index "dataset_data", ["dataset_row_id_id"], name: "index_dataset_data_on_dataset_row_id_id"

  create_table "dataset_fields", force: true do |t|
    t.integer  "dataset_id_id"
    t.string   "name"
    t.integer  "datatype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dataset_fields", ["dataset_id_id"], name: "index_dataset_fields_on_dataset_id_id"

  create_table "dataset_parameters", force: true do |t|
    t.string   "placeholder_name"
    t.integer  "placeholder_type"
    t.string   "placeholder_coverter"
    t.string   "placeholder_valid_values"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dataset_rows", force: true do |t|
    t.integer  "dataset_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dataset_rows", ["dataset_id_id"], name: "index_dataset_rows_on_dataset_id_id"

  create_table "datasets", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "license"
    t.string   "source"
    t.integer  "source_type"
    t.integer  "sync_frequency"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
