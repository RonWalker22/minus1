class Team < ApplicationRecord
  TITLE_OPTIONS = ['Operator', 'Lead Operator', 'Commander'].freeze

  validates_inclusion_of :title, in: TITLE_OPTIONS
  has_many :game_teams
  has_many :games, through: :game_teams
  belongs_to :commander, class_name: 'Operator'
  has_many :operator_teams
  has_many :operators, through: :operator_teams
  after_create :add_commander_to_memebers, :link_game

  private

    def add_commander_to_memebers
      self.operators << commander
    end

    def link_game
      GameTeam.create team_id: self.id, game_id: self.commander.game_setting_id 
    end
end
