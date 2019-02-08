class Respawn < ApplicationRecord
  belongs_to :game
  has_many :level_respawns, dependent: :delete_all
  has_many :level, through: :level_respawns
end
