require 'test_helper'

class OperatorTeamTest < ActiveSupport::TestCase
  setup do
    @operator = operators(:one)
    @team = teams(:one)
  end
  test 'disallows duplicate OperatorTeams' do
    begin
      OperatorTeam.create!(operator_id: @operator.id,
                           team_id: @team.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
