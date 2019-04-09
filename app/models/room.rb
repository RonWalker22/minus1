class Room < ApplicationRecord
  belongs_to :commander, class_name: 'User'
  belongs_to :strategy
  has_many :users
end
