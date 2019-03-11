class Respawn < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'Operator', foreign_key: 'operator_id'
  has_many :level_respawns, dependent: :delete_all
  has_many :level, through: :level_respawns
  after_destroy :remove_points
end
