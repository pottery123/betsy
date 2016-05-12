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

ActiveRecord::Schema.define(version: 20160512214608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "name"
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",                   null: false
    t.integer  "product_id",                 null: false
    t.integer  "quantity",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "shipped",    default: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "address"
    t.string   "name_on_cc"
    t.string   "security_on_cc"
    t.string   "expiration_on_cc"
    t.integer  "zip"
    t.string   "email"
    t.string   "status"
    t.integer  "order_id"
    t.float    "total"
    t.string   "credit_card_number"
  end

  create_table "products", force: :cascade do |t|
    t.text     "name",             null: false
    t.decimal  "price_in_dollars", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "quantity"
    t.boolean  "visible"
    t.text     "image_url"
    t.text     "description"
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
