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

ActiveRecord::Schema[7.0].define(version: 2024_01_20_234849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "toxicity", default: 0
    t.boolean "organic"
    t.boolean "recyclable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rc_users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.integer "role"
    t.bigint "recycling_company_id", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_rc_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_rc_users_on_email", unique: true
    t.index ["recycling_company_id"], name: "index_rc_users_on_recycling_company_id"
    t.index ["reset_password_token"], name: "index_rc_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_rc_users_on_uid_and_provider", unique: true
  end

  create_table "recycling_companies", force: :cascade do |t|
    t.string "name"
    t.string "registration_number"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rc_users", "recycling_companies"
end
