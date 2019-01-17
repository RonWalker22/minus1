require 'test_helper'

class StrategyTest < ActiveSupport::TestCase
  strategy = Strategy.all[random_index]
  test 'has operators' do
    assert_equal 'Operator', strategy.operators.first.class.name
  end

  test 'has a commander' do
    assert_equal 'Operator', strategy.commander.class.name
  end

  test 'has objectives' do
    assert_equal 'Objective', strategy.objectives.first.class.name
  end

  test 'has a level' do
    assert_equal 'Level', strategy.level.class.name
  end
end
