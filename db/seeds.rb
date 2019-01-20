# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  operator = Operator.create! name: "test#{i}", password: '123456'
  new_game = Game.create! name: "test#{i}", website: "www.test#{i}.com"
  level = Level.create! name: "test#{i}", game_id: new_game.id
  strategy = Strategy.create!(commander_id: operator.id,
                              level_id: level.id,
                              name: "test#{i}")
  Objective.create!(strategy_id: strategy.id,
                    target: "test#{i}",
                    action: "test#{i}",
                    name: "test#{i}")
end
