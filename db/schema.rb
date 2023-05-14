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

ActiveRecord::Schema[7.0].define(version: 2023_05_06_014025) do
  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_novels", id: false, force: :cascade do |t|
    t.integer "novel_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id", "novel_id"], name: "index_genres_novels_on_genre_id_and_novel_id"
    t.index ["novel_id", "genre_id"], name: "index_genres_novels_on_novel_id_and_genre_id"
  end

  create_table "novels", force: :cascade do |t|
    t.string "title"
    t.text "synopsis"
    t.integer "user_id", null: false
    t.string "status"
    t.date "published_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_novels_on_user_id"
  end

  create_table "novels_themes", id: false, force: :cascade do |t|
    t.integer "novel_id", null: false
    t.integer "theme_id", null: false
    t.index ["novel_id", "theme_id"], name: "index_novels_themes_on_novel_id_and_theme_id"
    t.index ["theme_id", "novel_id"], name: "index_novels_themes_on_theme_id_and_novel_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "novel_id", null: false
    t.string "rated"
    t.date "reviewed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_reviews_on_novel_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.text "bio"
    t.string "password"
    t.string "role"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "novels", "users"
  add_foreign_key "reviews", "novels"
  add_foreign_key "reviews", "users"
end
