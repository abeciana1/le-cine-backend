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

ActiveRecord::Schema.define(version: 2020_10_13_162841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "club_watchlists", force: :cascade do |t|
    t.integer "club_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "about"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "image"
    t.integer "member_count"
    t.integer "member_capacity"
    t.boolean "privacy", default: false
    t.integer "host_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "date"
    t.string "time"
    t.string "link"
    t.text "about"
    t.string "excerpt", default: ""
    t.integer "club_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
  end

  create_table "movie_meetings", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "meeting_id"
    t.boolean "discussion", default: true
    t.boolean "watch_along", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_records", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "backdrop_path"
    t.string "title"
    t.string "poster_path"
    t.integer "mov_id"
    t.text "overview"
    t.string "original_language"
    t.string "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_clubs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "club_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "image"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
