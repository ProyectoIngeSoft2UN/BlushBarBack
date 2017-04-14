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

ActiveRecord::Schema.define(version: 20170412165011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "cc",         null: false
    t.string   "name",       null: false
    t.string   "lastName",   null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "client_id",   null: false
    t.integer  "employee_id", null: false
    t.integer  "store_id",    null: false
    t.integer  "service_id",  null: false
    t.boolean  "is_paid",     null: false
    t.boolean  "active",      null: false
    t.datetime "dateTime",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["client_id"], name: "index_appointments_on_client_id", using: :btree
    t.index ["employee_id"], name: "index_appointments_on_employee_id", using: :btree
    t.index ["service_id"], name: "index_appointments_on_service_id", using: :btree
    t.index ["store_id"], name: "index_appointments_on_store_id", using: :btree
  end

  create_table "bill_products", force: :cascade do |t|
    t.integer  "bill_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_products_on_bill_id", using: :btree
    t.index ["product_id"], name: "index_bill_products_on_product_id", using: :btree
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "cost",           null: false
    t.integer  "client_id",      null: false
    t.integer  "store_id",       null: false
    t.string   "payment_method", null: false
    t.text     "description",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["client_id"], name: "index_bills_on_client_id", using: :btree
    t.index ["store_id"], name: "index_bills_on_store_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "string",      null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "cc",         null: false
    t.string   "name",       null: false
    t.string   "lastName",   null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.string   "address"
    t.string   "string"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "cc",         null: false
    t.string   "name",       null: false
    t.string   "lastName",   null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.integer  "store_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_employees_on_store_id", using: :btree
  end

  create_table "image_products", force: :cascade do |t|
    t.integer  "image_id",   null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_image_products_on_image_id", using: :btree
    t.index ["product_id"], name: "index_image_products_on_product_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "path",        null: false
    t.string   "string",      null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.integer  "category_id", null: false
    t.integer  "cost",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.integer  "cost",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stockstores", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "store_id",   null: false
    t.boolean  "available",  null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stockstores_on_product_id", using: :btree
    t.index ["store_id"], name: "index_stockstores_on_store_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "phone",      null: false
    t.integer  "admin_id",   null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_stores_on_admin_id", using: :btree
  end

  add_foreign_key "appointments", "clients"
  add_foreign_key "appointments", "employees"
  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "stores"
  add_foreign_key "bill_products", "bills"
  add_foreign_key "bill_products", "products"
  add_foreign_key "bills", "clients"
  add_foreign_key "bills", "stores"
  add_foreign_key "employees", "stores"
  add_foreign_key "image_products", "images"
  add_foreign_key "image_products", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "stockstores", "products"
  add_foreign_key "stockstores", "stores"
  add_foreign_key "stores", "admins"
end
