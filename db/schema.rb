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

ActiveRecord::Schema.define(version: 2018_06_24_151944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: :cascade do |t|
    t.bigint "company_id"
    t.string "chart_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_charts_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_sets", force: :cascade do |t|
    t.string "dataset_type"
    t.bigint "chart_id"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "outdated", default: false, null: false
    t.index ["chart_id"], name: "index_data_sets_on_chart_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float "total_rating"
    t.date "publish_date"
    t.float "social_rating"
    t.float "work_life_rating"
    t.float "image_rating"
    t.float "work_environment_rating"
    t.float "supervisor_behavior_rating"
    t.float "colleague_behavior_rating"
    t.float "interesting_tasks_rating"
    t.float "communication_rating"
    t.float "equality_rating"
    t.float "elder_colleagues_rating"
    t.float "career_rating"
    t.float "salary_rating"
    t.float "working_conditions_rating"
    t.string "company_name"
    t.string "city"
    t.string "job_state"
    t.string "position"
    t.string "department"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foreign_id", null: false
    t.string "type"
    t.index ["company_id"], name: "index_reviews_on_company_id"
    t.index ["foreign_id"], name: "index_reviews_on_foreign_id"
  end

  add_foreign_key "charts", "companies"
  add_foreign_key "data_sets", "charts"
  add_foreign_key "reviews", "companies"
end
