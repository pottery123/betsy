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

ActiveRecord::Schema.define(version: 20160506154631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.text     "email",            null: false
    t.text     "address",          null: false
    t.text     "name_on_cc",       null: false
    t.integer  "number_on_cc",     null: false
    t.text     "security_on_cc",   null: false
    t.datetime "expiration_on_cc", null: false
    t.integer  "zip",              null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "catagory", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text     "order_item_collecton"
    t.integer  "user_id",              null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "products", force: :cascade do |t|
    t.text     "name",                          null: false
    t.decimal  "price_in_dollars",              null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "categories",       default: [],              array: true
    t.integer  "quantity"
    t.boolean  "visible"
    t.text     "image_url"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",      null: false
    t.text     "review_text"
    t.integer  "user_id"
    t.integer  "product_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "user_name",       null: false
    t.text     "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest", null: false
  end

end
