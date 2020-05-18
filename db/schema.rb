# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_221640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "street"
    t.integer "str_number"
    t.string "adr_unit"
    t.string "adr_other"
    t.integer "adr_zip"
    t.string "adr_county"
    t.string "adr_state"
    t.string "adr_country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_adresses_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "phone_countrycode"
    t.integer "phone_number"
    t.string "email"
    t.integer "age"
    t.string "sex"
  end

  create_table "delivery_types", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "subtype_id", null: false
    t.integer "price"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subtype_id"], name: "index_products_on_subtype_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "sale_datetime"
    t.bigint "client_id", null: false
    t.bigint "total_amount"
    t.boolean "paid"
    t.bigint "payment_type_id", null: false
    t.bigint "delivery_type_id", null: false
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["delivery_type_id"], name: "index_sales_on_delivery_type_id"
    t.index ["payment_type_id"], name: "index_sales_on_payment_type_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "product_id", null: false
    t.integer "product_q"
    t.boolean "deleted"
    t.bigint "subtotal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_shopping_carts_on_product_id"
    t.index ["sale_id"], name: "index_shopping_carts_on_sale_id"
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "name"
    t.bigint "type_id", null: false
    t.datetime "modif_date"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_subtypes_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "modif_date"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "adresses", "clients"
  add_foreign_key "products", "subtypes"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "delivery_types"
  add_foreign_key "sales", "payment_types"
  add_foreign_key "shopping_carts", "products"
  add_foreign_key "shopping_carts", "sales"
  add_foreign_key "subtypes", "types"
end
