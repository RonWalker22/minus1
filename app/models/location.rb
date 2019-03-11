class Location < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'Operator', foreign_key: 'operator_id'
  has_many :level_locations, dependent: :delete_all
  has_many :levels, through: :level_locations
  has_many :objectives
  after_destroy :remove_points
end
