class Level < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :strategies
  has_many :level_respawns, dependent: :delete_all
  has_many :respawns, through: :level_respawns
  has_many :level_locations, dependent: :delete_all
  has_many :locations, through: :level_locations
end
