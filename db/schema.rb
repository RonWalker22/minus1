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

ActiveRecord::Schema.define(version: 2019_01_31_214608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.string "website", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.index ["website"], name: "index_games_on_website", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "name"
    t.integer "step", null: false
    t.text "content"
    t.boolean "private", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "step"], name: "index_ingredients_on_recipe_id_and_step", unique: true
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "levels", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_levels_on_game_id"
    t.index ["name", "game_id"], name: "index_levels_on_name_and_game_id", unique: true
  end

  create_table "modes", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_modes_on_level_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.bigint "master_id"
    t.bigint "next_id"
    t.bigint "strategy_id", null: false
    t.string "name", null: false
    t.string "target", null: false
    t.string "action", null: false
    t.integer "delay", default: 0, null: false
    t.integer "min_ops", default: 1, null: false
    t.integer "max_ops"
    t.integer "priority", default: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_objectives_on_master_id"
    t.index ["next_id"], name: "index_objectives_on_next_id"
    t.index ["strategy_id"], name: "index_objectives_on_strategy_id"
  end

  create_table "operator_recipes", force: :cascade do |t|
    t.bigint "operator_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id", "recipe_id"], name: "index_operator_recipes_on_operator_id_and_recipe_id", unique: true
    t.index ["operator_id"], name: "index_operator_recipes_on_operator_id"
    t.index ["recipe_id"], name: "index_operator_recipes_on_recipe_id"
  end

  create_table "operator_rooms", force: :cascade do |t|
    t.bigint "operator_id", null: false
    t.bigint "objective_id"
    t.bigint "room_id", null: false
    t.boolean "alive", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_operator_rooms_on_objective_id"
    t.index ["operator_id", "room_id"], name: "index_operator_rooms_on_operator_id_and_room_id", unique: true
    t.index ["operator_id"], name: "index_operator_rooms_on_operator_id"
    t.index ["room_id"], name: "index_operator_rooms_on_room_id"
  end

  create_table "operator_strategies", force: :cascade do |t|
    t.bigint "operator_id", null: false
    t.bigint "strategy_id"
    t.bigint "primary_id"
    t.bigint "secondary_id"
    t.bigint "tertiary_id"
    t.bigint "default_id"
    t.boolean "private", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_id"], name: "index_operator_strategies_on_default_id"
    t.index ["operator_id", "strategy_id"], name: "index_operator_strategies_on_operator_id_and_strategy_id", unique: true
    t.index ["operator_id"], name: "index_operator_strategies_on_operator_id"
    t.index ["primary_id"], name: "index_operator_strategies_on_primary_id"
    t.index ["secondary_id"], name: "index_operator_strategies_on_secondary_id"
    t.index ["strategy_id"], name: "index_operator_strategies_on_strategy_id"
    t.index ["tertiary_id"], name: "index_operator_strategies_on_tertiary_id"
  end

  create_table "operator_teams", force: :cascade do |t|
    t.bigint "operator_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id", "team_id"], name: "index_operator_teams_on_operator_id_and_team_id", unique: true
    t.index ["operator_id"], name: "index_operator_teams_on_operator_id"
    t.index ["team_id"], name: "index_operator_teams_on_team_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.boolean "online", default: false, null: false
    t.bigint "game_setting_id"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "favoritor_score"
    t.text "favoritor_total"
    t.index ["game_setting_id"], name: "index_operators_on_game_setting_id"
    t.index ["name"], name: "index_operators_on_name", unique: true
    t.index ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "objective_id"
    t.bigint "commander_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_recipes_on_commander_id"
    t.index ["objective_id"], name: "index_recipes_on_objective_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "commander_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false, null: false
    t.boolean "override_preference", default: false, null: false
    t.index ["commander_id"], name: "index_rooms_on_commander_id"
  end

  create_table "strategies", force: :cascade do |t|
    t.bigint "commander_id", null: false
    t.bigint "mode_id"
    t.bigint "inspiration_id"
    t.string "name", null: false
    t.boolean "private", default: false, null: false
    t.boolean "natural_flow", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "favoritable_score"
    t.text "favoritable_total"
    t.index ["commander_id"], name: "index_strategies_on_commander_id"
    t.index ["inspiration_id"], name: "index_strategies_on_inspiration_id"
    t.index ["mode_id"], name: "index_strategies_on_mode_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "commander_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_teams_on_commander_id"
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  add_foreign_key "objectives", "objectives", column: "master_id"
  add_foreign_key "objectives", "objectives", column: "next_id"
  add_foreign_key "operator_strategies", "objectives", column: "default_id"
  add_foreign_key "operator_strategies", "objectives", column: "primary_id"
  add_foreign_key "operator_strategies", "objectives", column: "secondary_id"
  add_foreign_key "operator_strategies", "objectives", column: "tertiary_id"
  add_foreign_key "operators", "games", column: "game_setting_id"
  add_foreign_key "recipes", "operators", column: "commander_id"
  add_foreign_key "rooms", "operators", column: "commander_id"
  add_foreign_key "strategies", "operators", column: "commander_id"
  add_foreign_key "strategies", "strategies", column: "inspiration_id"
  add_foreign_key "teams", "operators", column: "commander_id"
end
