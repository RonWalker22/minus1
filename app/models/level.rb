class Level < ApplicationRecord
  belongs_to :game
  has_many :strategies
  has_many :level_respawns, dependent: :delete_all
  has_many :respawns, through: :level_respawns
  has_many :locations, dependent: :delete_all
end
