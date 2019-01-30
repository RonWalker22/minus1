require 'test_helper'
require 'pry'
class StrategyTest < ActiveSupport::TestCase
  setup do
    @strategy = strategies(:one)
    @strategy_one = strategies(:one)
    @strategy_three = strategies(:three)
  end

  test 'has operators' do
    assert_equal 'Operator', @strategy.operators.first.class.name
  end

  test 'has a commander' do
    assert_equal 'Operator', @strategy.commander.class.name
  end

  test 'has objectives' do
    assert_equal 'Objective', @strategy.objectives.first.class.name
  end

  test 'has a mode' do
    assert_equal 'Mode', @strategy.mode.class.name
  end

  test 'has an inpiration' do
    assert_equal 'Strategy', @strategy_three.inspiration.class.name
  end

  test 'has inpirations' do
    assert_equal 'Strategy', @strategy_one.inspirations.first.class.name
  end
end
