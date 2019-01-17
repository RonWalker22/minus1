require 'test_helper'

class OperatorTeamTest < ActiveSupport::TestCase
  test 'disallows duplicate OperatorTeams' do
    begin
      OperatorTeam.create!(operator_id: Operator.first.id,
                           team_id: Team.first.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
