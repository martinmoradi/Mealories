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

ActiveRecord::Schema.define(version: 2020_41_20_162634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.bigint "lunch_id", null: false
    t.bigint "dinner_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dinner_id"], name: "index_days_on_dinner_id"
    t.index ["lunch_id"], name: "index_days_on_lunch_id"
    t.index ["plan_id"], name: "index_days_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.integer "servings", default: 1
    t.integer "prep_time"
    t.integer "cook_time"
    t.text "steps"
    t.text "ingredients_list"
    t.string "image_url"
    t.bigint "author_id", default: 1, null: false
    t.decimal "total_cal"
    t.decimal "total_prot"
    t.decimal "total_carbs"
    t.decimal "total_fat"
    t.string "marmiton_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_recipes_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "objective", default: 1
    t.integer "weight_in_kgs", default: 0
    t.string "gender", default: "Homme"
    t.integer "height_in_cms", default: 0
    t.integer "age", default: 0
    t.integer "activity_level", default: 1
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "days", "plans"
  add_foreign_key "days", "recipes", column: "dinner_id"
  add_foreign_key "days", "recipes", column: "lunch_id"
  add_foreign_key "plans", "users"
  add_foreign_key "recipes", "users", column: "author_id"
end
