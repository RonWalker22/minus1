class Respawn < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :level_respawns, dependent: :delete_all
  has_many :level, through: :level_respawns
  has_many :ingredients, as: :piece
end
