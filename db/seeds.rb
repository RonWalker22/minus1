# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

new_game = Game.create! name: "Tom Clancy's Rainbow Six® Siege",
                    igdb_id: 7360,
                    image_id: 'ktvusahfu7kmoqbpjbkz'

3.times do |i|
  operator = Operator.create! name: "operator#{i}", password: '123456'
  level = Level.create! name: "level#{i}", game_id: new_game.id, 
                        operator_id: operator.id
  mode = Mode.create! name: "mode#{i}", game_id: new_game.id,
                      operator_id: operator.id
  strategy = Strategy.create!(commander_id: operator.id,
                              game_id: new_game.id,
                              level_id: level.id,
                              mode_id: mode.id,
                              name: "strategy#{i}")
  objective = Objective.create!(strategy_id: strategy.id,
                                target: "target#{i}",
                                action: "action#{i}",
                                name: "objective#{i}")
  recipe = Recipe.create!(name: "recipe#{i}",
                          objective_id: objective.id,
                          commander_id: operator.id)
  Ingredient.create!(name: "ingredient#{i}",
                     recipe_id: recipe.id,
                     step: 1,
                     content: 'Go to the waterfall')
  respawn = Respawn.create! name: "respawn#{i}", game_id: new_game.id, 
                            operator_id: operator.id
  LevelRespawn.create level_id: level.id, respawn_id: respawn.id
  Character.create! name: "character#{i}", game_id: new_game.id, 
                    operator_id: operator.id
  location = Location.create! name: "loation#{i}", game_id: new_game.id,
                              operator_id: operator.id
  LevelLocation.create! level_id: level.id, location_id: location.id
end
