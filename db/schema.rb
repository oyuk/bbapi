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

ActiveRecord::Schema.define(version: 20150831052001) do

  create_table "game_dates", force: :cascade do |t|
    t.date     "game_date",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "home",         null: false
    t.string   "away",         null: false
    t.string   "start_time",   null: false
    t.string   "ball_park",    null: false
    t.string   "home_score"
    t.string   "away_score"
    t.string   "inning",       null: false
    t.string   "win_pitcher"
    t.string   "save_pitcher"
    t.string   "lose_pitcher"
    t.integer  "game_date_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "game_score"
  end

end
