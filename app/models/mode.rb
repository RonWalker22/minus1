class Mode < ApplicationRecord
  resourcify
  belongs_to :game
  belongs_to :author, class_name: 'Operator', foreign_key: 'operator_id'
  has_many :strategies
  after_destroy :remove_points
end
