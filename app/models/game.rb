class Game < ApplicationRecord
  resourcify
  acts_as_favoritable
  has_many :levels
  has_many :locations
  has_many :modes
  has_many :respawns
  has_many :characters
  has_many :strategies
end
