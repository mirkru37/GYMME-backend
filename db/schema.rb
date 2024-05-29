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

ActiveRecord::Schema[7.1].define(version: 2024_05_29_173256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklist_tokens", primary_key: "token", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "exercise_id"
    t.jsonb "attachment_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_attachments_on_exercise_id"
  end

  create_table "exercise_sets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "exercise_id", null: false
    t.uuid "workout_id", null: false
    t.integer "reps"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_sets_on_workout_id"
  end

  create_table "exercises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "is_public"
    t.boolean "is_visible", default: true
    t.string "name"
    t.text "instructions"
    t.uuid "primary_muscle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.jsonb "video_data"
    t.index ["primary_muscle_id"], name: "index_exercises_on_primary_muscle_id"
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "exercises_muscles", id: false, force: :cascade do |t|
    t.uuid "exercise_id"
    t.uuid "muscle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercises_muscles_on_exercise_id"
    t.index ["muscle_id"], name: "index_exercises_muscles_on_muscle_id"
  end

  create_table "muscles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "workouts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.time "duration"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercise_attachments", "exercises"
  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercise_sets", "workouts"
  add_foreign_key "workouts", "users"
end
