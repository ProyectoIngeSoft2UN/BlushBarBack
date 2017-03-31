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

ActiveRecord::Schema.define(version: 20170331042705) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "phone"
    t.text     "photo"
    t.integer  "Store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Store_id"], name: "index_admins_on_Store_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "idClient"
    t.string   "idEmployee"
    t.boolean  "payment"
    t.integer  "Client_id"
    t.integer  "Employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["Client_id"], name: "index_appointments_on_Client_id"
    t.index ["Employee_id"], name: "index_appointments_on_Employee_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "phone"
    t.text     "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "phone"
    t.text     "photo"
    t.integer  "Store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Store_id"], name: "index_employees_on_Store_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images_products", force: :cascade do |t|
    t.integer  "Image_id"
    t.integer  "Product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Image_id"], name: "index_images_products_on_Image_id"
    t.index ["Product_id"], name: "index_images_products_on_Product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products_categories", force: :cascade do |t|
    t.integer  "Category_id"
    t.integer  "Product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["Category_id"], name: "index_products_categories_on_Category_id"
    t.index ["Product_id"], name: "index_products_categories_on_Product_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "idProduct"
    t.integer  "cost"
    t.string   "payment"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
