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

ActiveRecord::Schema[7.0].define(version: 2023_05_04_063649) do
  create_table "accounts", force: :cascade do |t|
    t.string "coin_balance"
    t.string "refer_code"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "applists", force: :cascade do |t|
    t.string "title"
    t.string "logo"
    t.string "app_link"
    t.string "redeem_type"
    t.string "bonus"
    t.string "minimum_withdrawl"
    t.string "referral_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appopens", force: :cascade do |t|
    t.string "version_name"
    t.string "version_code"
    t.string "location"
    t.string "source_ip"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appopens_on_user_id"
  end

  create_table "game_points", force: :cascade do |t|
    t.string "title"
    t.string "img"
    t.string "link"
    t.string "game_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "title"
    t.string "short_title"
    t.integer "views"
    t.boolean "is_live"
    t.string "status"
    t.string "front_team"
    t.string "opp_team"
  end

  create_table "news", force: :cascade do |t|
    t.text "news"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_news_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "logo"
    t.string "name"
    t.integer "coins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_points_on_account_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "payout_name"
    t.string "payout_logo"
    t.string "payout_type"
    t.string "payout_amount"
    t.string "coin_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "task"
    t.integer "points"
    t.float "reward"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "mobile_number"
    t.string "gender"
    t.string "location"
    t.string "occupation"
    t.string "birth_date"
    t.string "profile_pic"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "deviceId"
    t.string "deviceType"
    t.string "deviceName"
    t.string "socialType"
    t.string "socialId"
    t.string "socialToken"
    t.string "socialEmail"
    t.string "socialName"
    t.string "socialImgurl"
    t.string "advertisingId"
    t.string "versionName"
    t.string "versionCode"
    t.string "utmSource"
    t.string "utmMedium"
    t.string "utmTerm"
    t.string "utmContent"
    t.string "utmCampaign"
    t.string "securityToken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "withdrawls", force: :cascade do |t|
    t.integer "coins"
    t.string "transaction_id"
    t.integer "amount"
    t.integer "reward_id"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_withdrawls_on_account_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "appopens", "users"
  add_foreign_key "news", "teams"
  add_foreign_key "players", "teams"
  add_foreign_key "points", "accounts"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "withdrawls", "accounts"
end
