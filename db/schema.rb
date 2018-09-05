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

ActiveRecord::Schema.define(version: 2018_09_05_154420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "video_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note", default: ""
    t.index ["user_id"], name: "index_histories_on_user_id"
    t.index ["video_id"], name: "index_histories_on_video_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.bigint "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_category_id"], name: "index_jobs_on_sub_category_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "super_category_id"
    t.bigint "user_id"
    t.integer "viewing_time_seconds", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "viewed_videos", default: 0
    t.integer "interest_score", default: 0
    t.index ["super_category_id"], name: "index_scores_on_super_category_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "skill_scores", force: :cascade do |t|
    t.bigint "sub_category_id"
    t.bigint "user_id"
    t.integer "viewed_videos", default: 0
    t.integer "skill_score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "viewing_time_seconds", default: 0
    t.boolean "checked"
    t.index ["sub_category_id"], name: "index_skill_scores_on_sub_category_id"
    t.index ["user_id"], name: "index_skill_scores_on_user_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "super_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["super_category_id"], name: "index_sub_categories_on_super_category_id"
  end

  create_table "super_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "slug"
    t.boolean "admin", default: false, null: false
    t.string "photo_id", default: "image/upload/v1536080431/tc91qgpwedo6dhey8w0t.png"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "video_categories", force: :cascade do |t|
    t.bigint "video_id"
    t.bigint "sub_category_id"
    t.integer "relevance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_category_id"], name: "index_video_categories_on_sub_category_id"
    t.index ["video_id"], name: "index_video_categories_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "youtube_id"
    t.integer "duration_seconds"
    t.integer "minimum_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.boolean "verified"
    t.boolean "pro"
    t.boolean "introduction"
    t.string "channel"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "videos"
  add_foreign_key "histories", "users"
  add_foreign_key "histories", "videos"
  add_foreign_key "jobs", "sub_categories"
  add_foreign_key "scores", "super_categories"
  add_foreign_key "scores", "users"
  add_foreign_key "skill_scores", "sub_categories"
  add_foreign_key "skill_scores", "users"
  add_foreign_key "sub_categories", "super_categories"
  add_foreign_key "video_categories", "sub_categories"
  add_foreign_key "video_categories", "videos"
end
