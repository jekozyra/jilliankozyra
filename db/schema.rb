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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120402194917) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.integer  "question_id"
    t.string   "participant_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "choices", :force => true do |t|
    t.string   "content"
    t.string   "choice_order"
    t.integer  "question_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "language"
    t.string   "original"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.string   "original_name"
    t.string   "email"
    t.string   "party_name"
    t.string   "survey_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "profile_link"
    t.string   "list_position"
    t.integer  "party_id"
  end

  create_table "participants_surveys", :id => false, :force => true do |t|
    t.integer "participant_id"
    t.integer "survey_id"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "original_name"
  end

  create_table "question_groups", :force => true do |t|
    t.string   "title"
    t.integer  "survey_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.string   "category"
    t.integer  "number"
    t.integer  "survey_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "question_group_id"
    t.integer  "language_id"
    t.boolean  "mandatory"
  end

  create_table "surveys", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "default_language_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
    t.boolean  "admin"
  end

end
