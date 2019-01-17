class Team < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  has_many :operator_teams
  has_many :operators, through: :operator_teams
end
