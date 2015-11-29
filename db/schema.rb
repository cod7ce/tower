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

ActiveRecord::Schema.define(version: 20151129162707) do

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "created_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["created_by"], name: "index_comments_on_created_by"
  add_index "comments", ["target_id", "target_type"], name: "index_comments_on_target_id_and_target_type"

  create_table "events", force: :cascade do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.integer  "fired_by"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["entity_id", "entity_type"], name: "index_events_on_entity_id_and_entity_type"
  add_index "events", ["fired_by"], name: "index_events_on_fired_by"
  add_index "events", ["target_id", "target_type"], name: "index_events_on_target_id_and_target_type"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["created_by"], name: "index_projects_on_created_by"
  add_index "projects", ["team_id"], name: "index_projects_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["created_by"], name: "index_teams_on_created_by"

  create_table "todos", force: :cascade do |t|
    t.string   "content"
    t.integer  "created_by"
    t.integer  "project_id"
    t.integer  "handled_by"
    t.datetime "estimated_completed_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "todos", ["created_by"], name: "index_todos_on_created_by"
  add_index "todos", ["handled_by"], name: "index_todos_on_handled_by"
  add_index "todos", ["project_id"], name: "index_todos_on_project_id"

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_projects", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "users_projects", ["project_id"], name: "index_users_projects_on_project_id"
  add_index "users_projects", ["user_id"], name: "index_users_projects_on_user_id"

  create_table "users_teams", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  add_index "users_teams", ["team_id"], name: "index_users_teams_on_team_id"
  add_index "users_teams", ["user_id"], name: "index_users_teams_on_user_id"

end
