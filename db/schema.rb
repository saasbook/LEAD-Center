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

ActiveRecord::Schema.define(version: 2019_05_07_225231) do

  create_table "questions", force: :cascade do |t|
    t.text "options"
    t.string "title"
    t.text "next_question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_type"
  end

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_question"
    t.string "question_queue"
  end

  create_table "responses", force: :cascade do |t|
    t.string "category"
    t.integer "question_id"
    t.integer "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.boolean "is_category"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["quiz_id"], name: "index_responses_on_quiz_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.integer "grad_year"
    t.string "major"
    t.string "gender"
    t.text "ethnicity"
    t.boolean "transfer"
    t.boolean "graduate"
    t.boolean "international"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
  end

end
