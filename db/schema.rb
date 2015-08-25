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

ActiveRecord::Schema.define(version: 20150824104427) do

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
    t.integer  "home_score",   null: false
    t.integer  "away_score",   null: false
    t.string   "inning",       null: false
    t.string   "win_pitcher",  null: false
    t.string   "save_pitcher", null: false
    t.string   "lose_pitcher", null: false
    t.integer  "game_date_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "game_score"
  end

end
