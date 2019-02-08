class Game < ApplicationRecord
  acts_as_favoritable
  has_many :levels
  has_many :modes
  has_many :respawns
  has_many :characters
  has_many :strategies
  has_many :game_operators
  has_many :maintainers, through: :game_operators, source: :operator
end
