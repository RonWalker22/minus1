class Strategy < ApplicationRecord
  acts_as_favoritable
  belongs_to :commander, class_name: 'Operator'
  belongs_to :mode
  belongs_to :game
  belongs_to :level
  belongs_to :inspiration, class_name: 'Strategy', optional: true
  has_many :inspirations,
           class_name: 'Strategy',
           foreign_key: 'inspiration_id',
           dependent: :nullify
  has_many :rooms
  has_many :operator_strategies
  has_many :operators, through: :operator_strategies
  has_many :objectives
end
