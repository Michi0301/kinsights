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

ActiveRecord::Schema.define(version: 2018_06_13_183041) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapshots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "employee_rating_count"
    t.float "employee_rating_avg"
    t.integer "applicant_rating_count"
    t.float "applicant_rating_avg"
    t.integer "trainee_rating_count"
    t.float "trainee_rating_avg"
    t.integer "recomendation_rate"
    t.integer "visits_count"
    t.integer "employer_comments_count"
    t.integer "reviews_count"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_snapshots_on_company_id"
  end

  add_foreign_key "snapshots", "companies"
end
