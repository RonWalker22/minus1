require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  team = Team.all[random_index]
  test 'has operators' do
    assert_equal 'Operator', team.operators.first.class.name
  end

  test 'has a commander' do
    assert_equal 'Operator', team.commander.class.name
  end
end
