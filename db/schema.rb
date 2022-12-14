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

ActiveRecord::Schema.define(version: 2023_01_03_145556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "logo"
    t.string "icon"
    t.text "description"
    t.text "content"
    t.text "rem"
    t.text "marketing"
    t.text "criterion"
    t.integer "status"
    t.boolean "bonus"
    t.boolean "cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "external_url"
    t.string "product_type"
    t.string "domaine"
    t.integer "min_price"
    t.integer "max_price"
    t.boolean "has_marketing"
  end

  create_table "socials", force: :cascade do |t|
    t.string "logo"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "title"
    t.string "font_icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_tags_on_product_id"
  end

  create_table "user_product_temps", force: :cascade do |t|
    t.float "cpf_rate"
    t.float "fp_rate"
    t.bigint "user_product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_product_id"], name: "index_user_product_temps_on_user_product_id"
  end

  create_table "user_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "secret"
    t.string "external_id"
    t.integer "visits", default: 0
    t.integer "inscriptions", default: 0
    t.integer "ventes", default: 0
    t.integer "commissions", default: 0
    t.integer "commissions_pending", default: 0
    t.integer "commissions_validated", default: 0
    t.boolean "linked", default: false
    t.integer "master_affiliate_commission", default: 0
    t.integer "bonus", default: 0
    t.index ["product_id"], name: "index_user_products_on_product_id"
    t.index ["user_id"], name: "index_user_products_on_user_id"
  end

  create_table "user_socials", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "social_id", null: false
    t.string "pseudo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["social_id"], name: "index_user_socials_on_social_id"
    t.index ["user_id"], name: "index_user_socials_on_user_id"
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
    t.string "numero_de_telephone"
    t.string "pseudo"
    t.boolean "step_1"
    t.boolean "step_2"
    t.boolean "confirmed"
    t.bigint "master_affiliate_id"
    t.string "master_affiliate_url"
    t.string "master_affiliate_bitly"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["master_affiliate_id"], name: "index_users_on_master_affiliate_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tags", "products"
  add_foreign_key "user_product_temps", "user_products"
  add_foreign_key "user_products", "products"
  add_foreign_key "user_products", "users"
  add_foreign_key "user_socials", "socials"
  add_foreign_key "user_socials", "users"
end
