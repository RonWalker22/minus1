class Strategy < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  belongs_to :level
  has_many :rooms
  has_many :operator_strategies
  has_many :operators, through: :operator_strategies
  has_many :objectives
end
