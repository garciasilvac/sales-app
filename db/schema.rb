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

ActiveRecord::Schema.define(version: 2020_08_13_161136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.float "longitude"
    t.float "latitude"
    t.string "adressable_type"
    t.bigint "adressable_id"
    t.boolean "deleted"
    t.index ["adressable_type", "adressable_id"], name: "index_adresses_on_adressable_type_and_adressable_id"
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
    t.string "sex"
    t.date "birthdate"
    t.boolean "deleted"
  end

  create_table "cost_classes", force: :cascade do |t|
    t.boolean "deleted"
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_cost_classes_on_parent_id"
  end

  create_table "costs", force: :cascade do |t|
    t.boolean "deleted"
    t.string "name"
    t.bigint "value"
    t.string "document_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cost_class_id", null: false
    t.datetime "cost_datetime"
    t.boolean "paid"
    t.index ["cost_class_id"], name: "index_costs_on_cost_class_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.date "sched_date"
    t.integer "sched_timeblock"
    t.boolean "delivered"
    t.date "real_date"
    t.integer "real_timeblock"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "successful"
    t.text "driver_comment"
    t.bigint "adress_id"
    t.bigint "price"
    t.index ["adress_id"], name: "index_deliveries_on_adress_id"
    t.index ["sale_id"], name: "index_deliveries_on_sale_id"
  end

  create_table "delivery_types", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "requires_delivery"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "point_of_sales", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "timezone"
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

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "sale_datetime"
    t.bigint "client_id", null: false
    t.bigint "total_amount"
    t.boolean "paid"
    t.bigint "payment_type_id"
    t.bigint "delivery_type_id"
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

  create_table "stocks", force: :cascade do |t|
    t.string "stockable_type"
    t.bigint "stockable_id"
    t.bigint "quantity"
    t.string "SKU"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_stocks_on_parent_id"
    t.index ["stockable_type", "stockable_id"], name: "index_stocks_on_stockable_type_and_stockable_id"
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

  create_table "timeblocks", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "start_time"
    t.time "end_time"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "modif_date"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "costs", "cost_classes"
  add_foreign_key "deliveries", "adresses"
  add_foreign_key "deliveries", "sales"
  add_foreign_key "products", "subtypes"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "delivery_types"
  add_foreign_key "sales", "payment_types"
  add_foreign_key "shopping_carts", "products"
  add_foreign_key "shopping_carts", "sales"
  add_foreign_key "subtypes", "types"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
