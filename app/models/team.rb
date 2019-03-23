class Team < ApplicationRecord
  has_many :game_teams
  has_many :games, through: :game_teams
  belongs_to :commander, class_name: 'Operator'
  has_many :operator_teams
  has_many :operators, through: :operator_teams
  has_many :strategy_teams, dependent: :delete_all
  has_many :strategies, through: :strategy_teams
  after_create :add_commander_to_memebers, :update_commander_rank, :link_game

  private

    def add_commander_to_memebers
      self.operators << self.commander

    end

    def update_commander_rank
      member = self.operator_teams.first
      member.title = 'Commander'
      member.save
    end

    def link_game
      GameTeam.create team_id: self.id, game_id: self.commander.game_setting_id 
    end
end
