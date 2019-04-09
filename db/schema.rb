# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_09_212915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_characters_on_game_id"
    t.index ["name", "game_id"], name: "index_characters_on_name_and_game_id", unique: true
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "directions", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "name", null: false
    t.integer "step", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "step"], name: "index_directions_on_recipe_id_and_step", unique: true
    t.index ["recipe_id"], name: "index_directions_on_recipe_id"
  end

  create_table "game_teams", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_teams_on_game_id"
    t.index ["team_id", "game_id"], name: "index_game_teams_on_team_id_and_game_id", unique: true
    t.index ["team_id"], name: "index_game_teams_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.string "image_id"
    t.integer "igdb_id"
    t.string "status", default: "proposal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["igdb_id"], name: "index_games_on_igdb_id", unique: true
    t.index ["name"], name: "index_games_on_name", unique: true
    t.index ["website"], name: "index_games_on_website", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "piece_type"
    t.integer "piece_id"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ingredients_on_parent_id"
    t.index ["piece_type", "piece_id", "recipe_id"], name: "index_ingredients_on_piece_type_and_piece_id_and_recipe_id", unique: true
    t.index ["piece_type", "piece_id"], name: "index_ingredients_on_piece_type_and_piece_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "level_locations", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id", "location_id"], name: "index_level_locations_on_level_id_and_location_id", unique: true
    t.index ["level_id"], name: "index_level_locations_on_level_id"
    t.index ["location_id"], name: "index_level_locations_on_location_id"
  end

  create_table "level_respawns", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.bigint "respawn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id", "respawn_id"], name: "index_level_respawns_on_level_id_and_respawn_id", unique: true
    t.index ["level_id"], name: "index_level_respawns_on_level_id"
    t.index ["respawn_id"], name: "index_level_respawns_on_respawn_id"
  end

  create_table "levels", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_levels_on_game_id"
    t.index ["name", "game_id"], name: "index_levels_on_name_and_game_id", unique: true
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "loadouts", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id"
    t.bigint "user_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_loadouts_on_game_id"
    t.index ["name", "game_id"], name: "index_loadouts_on_name_and_game_id", unique: true
    t.index ["user_id"], name: "index_loadouts_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_locations_on_game_id"
    t.index ["name", "game_id"], name: "index_locations_on_name_and_game_id", unique: true
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "modes", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_modes_on_game_id"
    t.index ["name", "game_id"], name: "index_modes_on_name_and_game_id", unique: true
    t.index ["user_id"], name: "index_modes_on_user_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.bigint "master_id"
    t.bigint "next_id"
    t.bigint "strategy_id", null: false
    t.string "name", null: false
    t.bigint "target_id"
    t.string "action", null: false
    t.integer "delay", default: 0, null: false
    t.integer "min_ops", default: 1, null: false
    t.integer "max_ops", default: 1, null: false
    t.integer "priority", default: 10, null: false
    t.uuid "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_objectives_on_master_id"
    t.index ["next_id"], name: "index_objectives_on_next_id"
    t.index ["strategy_id"], name: "index_objectives_on_strategy_id"
    t.index ["target_id"], name: "index_objectives_on_target_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "objective_id"
    t.bigint "commander_id", null: false
    t.uuid "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_recipes_on_commander_id"
    t.index ["objective_id"], name: "index_recipes_on_objective_id"
  end

  create_table "respawns", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_respawns_on_game_id"
    t.index ["name", "game_id"], name: "index_respawns_on_name_and_game_id", unique: true
    t.index ["user_id"], name: "index_respawns_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "commander_id", null: false
    t.bigint "strategy_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false, null: false
    t.boolean "override_preference", default: false, null: false
    t.index ["commander_id"], name: "index_rooms_on_commander_id"
    t.index ["strategy_id"], name: "index_rooms_on_strategy_id"
  end

  create_table "strategies", force: :cascade do |t|
    t.bigint "commander_id", null: false
    t.bigint "mode_id"
    t.bigint "level_id"
    t.bigint "game_id"
    t.integer "assignment_flow", default: [], array: true
    t.bigint "inspiration_id"
    t.string "name", null: false
    t.boolean "private", default: false, null: false
    t.boolean "natural_flow", default: true, null: false
    t.uuid "uuid"
    t.string "version", default: "0z", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_strategies_on_commander_id"
    t.index ["game_id"], name: "index_strategies_on_game_id"
    t.index ["inspiration_id"], name: "index_strategies_on_inspiration_id"
    t.index ["level_id"], name: "index_strategies_on_level_id"
    t.index ["mode_id"], name: "index_strategies_on_mode_id"
  end

  create_table "strategy_teams", force: :cascade do |t|
    t.bigint "strategy_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strategy_id"], name: "index_strategy_teams_on_strategy_id"
    t.index ["team_id", "strategy_id"], name: "index_strategy_teams_on_team_id_and_strategy_id", unique: true
    t.index ["team_id"], name: "index_strategy_teams_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "commander_id", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_teams_on_commander_id"
  end

  create_table "user_recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_user_recipes_on_recipe_id"
    t.index ["user_id", "recipe_id"], name: "index_user_recipes_on_user_id_and_recipe_id", unique: true
    t.index ["user_id"], name: "index_user_recipes_on_user_id"
  end

  create_table "user_strategies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "strategy_id", null: false
    t.bigint "objective_id"
    t.bigint "primary_id"
    t.bigint "secondary_id"
    t.bigint "tertiary_id"
    t.bigint "default_id"
    t.boolean "private", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_id"], name: "index_user_strategies_on_default_id"
    t.index ["objective_id"], name: "index_user_strategies_on_objective_id"
    t.index ["primary_id"], name: "index_user_strategies_on_primary_id"
    t.index ["secondary_id"], name: "index_user_strategies_on_secondary_id"
    t.index ["strategy_id"], name: "index_user_strategies_on_strategy_id"
    t.index ["tertiary_id"], name: "index_user_strategies_on_tertiary_id"
    t.index ["user_id", "strategy_id"], name: "index_user_strategies_on_user_id_and_strategy_id", unique: true
    t.index ["user_id"], name: "index_user_strategies_on_user_id"
  end

  create_table "user_teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.string "title", default: "User", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id", "team_id"], name: "index_user_teams_on_user_id_and_team_id", unique: true
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "online", default: false, null: false
    t.bigint "game_setting_id", default: 1
    t.bigint "room_id"
    t.string "uid"
    t.string "provider"
    t.string "api_key"
    t.string "encrypted_email"
    t.string "encrypted_email_iv"
    t.string "encrypted_email_bidx"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_objective_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["current_objective_id"], name: "index_users_on_current_objective_id"
    t.index ["encrypted_email_bidx"], name: "index_users_on_encrypted_email_bidx", unique: true
    t.index ["encrypted_email_iv"], name: "index_users_on_encrypted_email_iv", unique: true
    t.index ["game_setting_id"], name: "index_users_on_game_setting_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "characters", "games"
  add_foreign_key "characters", "users"
  add_foreign_key "ingredients", "ingredients", column: "parent_id"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "level_locations", "levels"
  add_foreign_key "level_locations", "locations"
  add_foreign_key "level_respawns", "levels"
  add_foreign_key "level_respawns", "respawns"
  add_foreign_key "levels", "games"
  add_foreign_key "levels", "users"
  add_foreign_key "loadouts", "games"
  add_foreign_key "loadouts", "users"
  add_foreign_key "locations", "games"
  add_foreign_key "locations", "users"
  add_foreign_key "modes", "users"
  add_foreign_key "objectives", "locations", column: "target_id"
  add_foreign_key "objectives", "objectives", column: "master_id"
  add_foreign_key "objectives", "objectives", column: "next_id"
  add_foreign_key "recipes", "users", column: "commander_id"
  add_foreign_key "respawns", "games"
  add_foreign_key "respawns", "users"
  add_foreign_key "rooms", "users", column: "commander_id"
  add_foreign_key "strategies", "strategies", column: "inspiration_id"
  add_foreign_key "strategies", "users", column: "commander_id"
  add_foreign_key "strategy_teams", "strategies"
  add_foreign_key "strategy_teams", "teams"
  add_foreign_key "teams", "users", column: "commander_id"
  add_foreign_key "user_strategies", "objectives", column: "default_id"
  add_foreign_key "user_strategies", "objectives", column: "primary_id"
  add_foreign_key "user_strategies", "objectives", column: "secondary_id"
  add_foreign_key "user_strategies", "objectives", column: "tertiary_id"
  add_foreign_key "users", "games", column: "game_setting_id"
  add_foreign_key "users", "objectives", column: "current_objective_id"
end
