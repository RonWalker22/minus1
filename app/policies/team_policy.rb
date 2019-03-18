class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def change_member_title?
    member = OperatorTeam.find_by(operator_id: user.id, team_id: record.id)
    member.title == 'Commander'
  end
end
