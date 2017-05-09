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

ActiveRecord::Schema.define(version: 20170502013903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_crops", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "crop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_crops_on_category_id", using: :btree
    t.index ["crop_id"], name: "index_category_crops_on_crop_id", using: :btree
  end

  create_table "crops", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.date     "date"
    t.text     "crop"
    t.decimal  "quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "harvested_from"
    t.string   "donated_to"
    t.text     "comments"
  end

  create_table "searches", force: :cascade do |t|
    t.date     "min_date"
    t.date     "max_date"
    t.string   "crop"
    t.string   "harvested_from"
    t.string   "donated_to"
    t.decimal  "min_quantity"
    t.decimal  "max_quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "role",            default: "standard"
  end

  add_foreign_key "category_crops", "categories"
  add_foreign_key "category_crops", "crops"
end
