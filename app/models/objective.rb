class Objective < ApplicationRecord
  belongs_to :strategy
  belongs_to :master,
             class_name: 'Objective',
             foreign_key: 'master_id',
             optional: true
  belongs_to :next,
             class_name: 'Objective',
             foreign_key: 'next_id',
             optional: true
  has_many :previous,
           class_name: 'Objective',
           foreign_key: 'next_id'
  has_many :recipes
  has_many :slaves,
           class_name: 'Objective',
           foreign_key: 'master_id'
  has_many :operator_rooms
  has_many :operators, through: :operator_rooms
end
