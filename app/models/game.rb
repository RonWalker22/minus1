class Game < ApplicationRecord
  acts_as_favoritable
  has_many :levels
end
