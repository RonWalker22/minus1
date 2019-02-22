class Room < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  has_many :operators
end
