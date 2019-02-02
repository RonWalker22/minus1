class Game < ApplicationRecord
  acts_as_favoritable
  has_many :levels
  has_many :modes
  has_many :strategies
end
