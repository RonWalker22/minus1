class Room < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  has_many :operator_rooms
  has_many :operators, through: :operator_rooms
end
