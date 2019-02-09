class StrategyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return false unless user.game_setting_id
    if record.class == Class
      Game.find(user.game_setting_id).status == 'supported'
    else 
      record.game.status == 'supported'
    end
  end
end
