require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  team = Team.all[random_index]
  test 'has users' do
    assert_equal 'User', team.users.first.class.name
  end

  test 'has a commander' do
    assert_equal 'User', team.commander.class.name
  end
end
