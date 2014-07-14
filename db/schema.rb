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

ActiveRecord::Schema.define(version: 20140714203616) do

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "assignments_id"
    t.string   "url"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completed_assignments", ["assignments_id"], name: "index_completed_assignments_on_assignments_id"
  add_index "completed_assignments", ["user_id"], name: "index_completed_assignments_on_user_id"

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.string   "url"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["assignment_id"], name: "index_submissions_on_assignment_id"
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "teacher"
  end

end
