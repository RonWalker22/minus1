class Team < ApplicationRecord
  belongs_to :commander, class_name: 'Operator'
  has_many :operator_teams
  has_many :operators, through: :operator_teams
  after_create :add_commander_to_memebers

  private

    def add_commander_to_memebers
      operators << commander
    end
end
