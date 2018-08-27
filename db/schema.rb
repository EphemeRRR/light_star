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

ActiveRecord::Schema.define(version: 2018_08_27_161608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: :cascade do |t|
    t.bigint "video_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
    t.index ["video_id"], name: "index_histories_on_video_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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
  end

  add_foreign_key "histories", "users"
  add_foreign_key "histories", "videos"
  add_foreign_key "sub_categories", "super_categories"
  add_foreign_key "video_categories", "sub_categories"
  add_foreign_key "video_categories", "videos"
end
