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

ActiveRecord::Schema.define(version: 20170405143122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "cc"
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "employee_id"
    t.boolean  "payment"
    t.boolean  "active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "appointmentDate"
    t.time     "appointmentTime"
    t.index ["client_id"], name: "index_appointments_on_client_id", using: :btree
    t.index ["employee_id"], name: "index_appointments_on_employee_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categories_products_on_category_id", using: :btree
    t.index ["product_id"], name: "index_categories_products_on_product_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "cc"
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "cc"
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.integer  "store_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["store_id"], name: "index_employees_on_store_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_images_products_on_image_id", using: :btree
    t.index ["product_id"], name: "index_images_products_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "quantity"
    t.boolean  "available"
  end

  create_table "products_stores", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_stores_on_product_id", using: :btree
    t.index ["store_id"], name: "index_products_stores_on_store_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "cost"
    t.integer  "client_id"
    t.integer  "product_id"
    t.string   "payment"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["client_id"], name: "index_purchases_on_client_id", using: :btree
    t.index ["product_id"], name: "index_purchases_on_product_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_stores_on_admin_id", using: :btree
  end

  add_foreign_key "appointments", "clients"
  add_foreign_key "appointments", "employees"
  add_foreign_key "categories_products", "categories"
  add_foreign_key "categories_products", "products"
  add_foreign_key "employees", "stores"
  add_foreign_key "images_products", "images"
  add_foreign_key "images_products", "products"
  add_foreign_key "products_stores", "products"
  add_foreign_key "products_stores", "stores"
  add_foreign_key "purchases", "clients"
  add_foreign_key "purchases", "products"
  add_foreign_key "stores", "admins"
end
