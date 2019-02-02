class Mode < ApplicationRecord
  belongs_to :game
  belongs_to :level
  has_many :strategies
end
