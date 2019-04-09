require 'test_helper'

class UserTeamTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @team = teams(:one)
  end
  test 'disallows duplicate UserTeams' do
    begin
      UserTeam.create!(user_id: @user.id,
                           team_id: @team.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
