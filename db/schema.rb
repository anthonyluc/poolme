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

ActiveRecord::Schema.define(version: 20171206142117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "country"
    t.string "email"
    t.string "phone_number"
    t.string "website"
    t.string "photos"
    t.boolean "blocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.string "name"
    t.string "discussion_id"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_discussions_on_project_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "legal_representatives", force: :cascade do |t|
    t.string "grade"
    t.string "phone_number"
    t.string "email"
    t.text "description"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_legal_representatives_on_company_id"
    t.index ["user_id"], name: "index_legal_representatives_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "discussion_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "models", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_models_on_role_id"
    t.index ["user_id"], name: "index_models_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.string "country"
    t.boolean "done"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "review_projects", force: :cascade do |t|
    t.integer "note"
    t.text "commentary"
    t.integer "alert"
    t.boolean "hide"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_review_projects_on_project_id"
    t.index ["user_id"], name: "index_review_projects_on_user_id"
  end

  create_table "review_users", force: :cascade do |t|
    t.integer "note"
    t.text "commentary"
    t.integer "alert"
    t.boolean "hide"
    t.bigint "legal_representative_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_representative_id"], name: "index_review_users_on_legal_representative_id"
    t.index ["user_id"], name: "index_review_users_on_user_id"
  end

  create_table "role_skills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_skills_on_role_id"
    t.index ["skill_id"], name: "index_role_skills_on_skill_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photos"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer "income"
    t.integer "selected_user_id"
    t.bigint "project_id"
    t.string "gender"
    t.string "ethnicity"
    t.string "skin_color"
    t.string "hair_color"
    t.string "haircut"
    t.integer "height"
    t.string "weight"
    t.string "corpulence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "hours"
    t.index ["project_id"], name: "index_roles_on_project_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.text "description"
    t.string "username"
    t.text "address"
    t.string "city"
    t.string "country"
    t.string "photos"
    t.boolean "newsletter"
    t.boolean "model"
    t.boolean "blocked"
    t.string "gender"
    t.string "ethnicity"
    t.string "skin_color"
    t.string "hair_color"
    t.string "haircut"
    t.integer "height"
    t.integer "weight"
    t.string "corpulence"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "discussions", "projects"
  add_foreign_key "discussions", "users"
  add_foreign_key "legal_representatives", "companies"
  add_foreign_key "legal_representatives", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "models", "roles"
  add_foreign_key "models", "users"
  add_foreign_key "projects", "companies"
  add_foreign_key "review_projects", "projects"
  add_foreign_key "review_projects", "users"
  add_foreign_key "review_users", "legal_representatives"
  add_foreign_key "review_users", "users"
  add_foreign_key "role_skills", "roles"
  add_foreign_key "role_skills", "skills"
  add_foreign_key "roles", "projects"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
