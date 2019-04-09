class Location < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :level_locations, dependent: :delete_all
  has_many :levels, through: :level_locations
  has_many :objectives
end
