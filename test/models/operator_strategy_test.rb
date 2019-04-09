require 'test_helper'

class UserStrategyTest < ActiveSupport::TestCase
  user_strat = UserStrategy.all[random_index]
  setup do
    @user = users(:one)
    @strategy = strategies(:one)
  end

  test 'disallows duplicate UserStrategy' do
    begin
      UserStrategy.create!(user_id: @user.id,
                               strategy_id: @strategy.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
  test 'has a primary objective' do
    assert_equal 'Objective', user_strat.primary.class.name
  end
  test 'has a secondary objective preference' do
    assert_equal 'Objective', user_strat.secondary.class.name
  end
  test 'has a tertiary objective preference' do
    assert_equal 'Objective', user_strat.tertiary.class.name
  end
  test 'has a default objective preference' do
    assert_equal 'Objective', user_strat.default.class.name
  end
end
