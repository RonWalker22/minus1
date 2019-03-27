class Game < ApplicationRecord
  resourcify
  has_many :levels
  has_many :locations
  has_many :modes
  has_many :respawns
  has_many :loadouts
  has_many :characters
  has_many :strategies
  has_many :operators
  has_many :game_teams
  has_many :teams, through: :game_teams
end
