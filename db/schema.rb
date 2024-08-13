# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_12_135157) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "enquiries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "subject", null: false
    t.text "message", null: false
    t.text "response"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_enquiries_on_user_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mechanic_name"
    t.string "mechanic_contact_number"
    t.string "mechanic_email"
    t.string "mechanic_address"
  end

  create_table "service_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "service_description"
    t.text "status"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle_name"
    t.string "vehicle_model"
    t.string "vehicle_registraion_number"
    t.date "service_date"
    t.time "service_time"
    t.integer "delivery_type"
    t.string "vehicle_registration_number"
    t.string "service_by"
    t.integer "service_charges"
    t.integer "additional_charges"
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_brands", force: :cascade do |t|
    t.string "vehicle_brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_categories", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_name"
  end

  add_foreign_key "enquiries", "users"
  add_foreign_key "service_requests", "users"
end
