class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def change_member_title?
    member = UserTeam.find_by(user_id: user.id, team_id: record.id)
    member && member.title == 'Commander'
  end
end
