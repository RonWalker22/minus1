# users
class Operator < ApplicationRecord
  has_many :commander_seats,
           class_name: 'Room',
           foreign_key: 'commander_id'
  has_many :commander_teams,
           class_name: 'Team',
           foreign_key: 'commander_id'
  has_many :commander_recipes,
           class_name: 'Recipe',
           foreign_key: 'commander_id'
  has_many :commander_strategies,
           class_name: 'Strategy',
           foreign_key: 'commander_id'
  has_many :operator_rooms
  has_many :rooms, through: :operator_rooms
  has_many :operator_strategies
  has_many :strategies, through: :operator_strategies
  has_many :operator_recipes
  has_many :recipes, through: :operator_recipes
  has_many :operator_teams
  has_many :teams, through: :operator_teams
end
