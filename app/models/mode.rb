class Mode < ApplicationRecord
  belongs_to :game
  has_many :strategies
end
