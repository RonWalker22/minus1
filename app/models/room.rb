class Room < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  belongs_to :strategy
  has_many :operators
end
