class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record_author = record.commander
    strategy_author = record.objective.strategy.commander

    return true if record_author == user || strategy_author == user

    record.objective.strategy.teams.includes(:operators).each do |team|
      if team.operators.include?(user)
        member = OperatorTeam.find_by(team_id: team.id, operator_id: user.id)
        return true unless member.title == 'Operator'
      end
    end
    false
  end

  def destroy?
    record.commander == user
  end
end
