# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150319043100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cheatsheets", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content"
    t.boolean  "published"
    t.boolean  "archived"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "cheatsheets", ["title"], name: "index_cheatsheets_on_title", using: :btree
  add_index "cheatsheets", ["user_id"], name: "index_cheatsheets_on_user_id", using: :btree

  create_table "deck_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deck_id"
    t.integer  "total_cards"
    t.integer  "total_correct"
    t.text     "missed_cards_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deck_events", ["deck_id"], name: "index_deck_events_on_deck_id", using: :btree
  add_index "deck_events", ["user_id"], name: "index_deck_events_on_user_id", using: :btree

  create_table "decks", force: :cascade do |t|
    t.string   "name",              limit: 45
    t.string   "status",            limit: 255
    t.text     "description"
    t.integer  "flash_cards_count",             default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["name"], name: "index_decks_on_name", using: :btree
  add_index "decks", ["status"], name: "index_decks_on_status", using: :btree
  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "flash_cards", force: :cascade do |t|
    t.text     "front"
    t.text     "back"
    t.integer  "sequence"
    t.string   "difficulty", limit: 255, default: "1"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flash_cards", ["deck_id"], name: "index_flash_cards_on_deck_id", using: :btree
  add_index "flash_cards", ["sequence"], name: "index_flash_cards_on_sequence", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "content"
    t.boolean  "show",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["name"], name: "index_pages_on_name", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question_type", limit: 255
    t.text     "content"
    t.text     "remarks"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree

  create_table "quiz_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.string   "status",           limit: 255, default: "Incomplete"
    t.integer  "total_correct",                default: 0
    t.integer  "total_answered",               default: 0
    t.integer  "last_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_events", ["quiz_id"], name: "index_quiz_events_on_quiz_id", using: :btree
  add_index "quiz_events", ["user_id"], name: "index_quiz_events_on_user_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.integer  "author_id"
    t.boolean  "published"
    t.integer  "category_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questions_count",             default: 0
  end

  add_index "quizzes", ["author_id"], name: "index_quizzes_on_author_id", using: :btree
  add_index "quizzes", ["category_id"], name: "index_quizzes_on_category_id", using: :btree
  add_index "quizzes", ["subject_id"], name: "index_quizzes_on_subject_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["category_id"], name: "index_subjects_on_category_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
