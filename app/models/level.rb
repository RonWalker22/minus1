class Level < ApplicationRecord
  belongs_to :game
  has_many :modes
  has_many :strategies
end
