require 'test_helper'
require 'pry'

class StrategiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @supported_game = games(:one)
    @unsupported_game = games(:two)
    @level = levels(:one)
    @mode = modes(:one)
    @strategy_one = strategies(:one)
    @strategy_two = strategies(:two)
    @operator = operators(:one)
    sign_in @operator
  end

  test 'should get index' do
    get strategies_url
    assert_response :success
  end

  test 'should get new' do
    get new_strategy_url
    assert_response :success
  end

  test 'should create strategy' do
    assert_difference('Strategy.count') do
      post strategies_url, params: { strategy: { name: 'S4',
                                                 mode_id: @mode.id,
                                                 game_id: @supported_game.id,
                                                 level_id: @level.id } }
    end

    assert_redirected_to strategy_url(Strategy.last)
  end

  test 'should not create strategy' do
    assert_no_difference('Strategy.count') do
      begin
        post strategies_url, params: { strategy: { name: 'S4',
                                                   mode_id: @mode.id,
                                                   game_id: @unsupported_game.id,
                                                   level_id: @level.id } }
      rescue Pundit::NotAuthorizedError => invalid
      end
      assert invalid
    end
  end

  # strategy_one's game is supported.
  test 'should show strategy' do
    get strategy_url(@strategy_one)
    assert_response :success
  end

  # strategy_two's game is not supported.
  test 'should not show strategy' do
    begin get strategy_url(@strategy_two)
    rescue Pundit::NotAuthorizedError => invalid
    end
    assert invalid
  end

  test 'should get edit' do
    get edit_strategy_url(@strategy_one)
    assert_response :success
  end

  test 'should update strategy' do
    patch strategy_url(@strategy_one), params: { strategy: { name: 'G44' } }
    assert_redirected_to strategy_url(@strategy_one)
  end

  test 'should destroy strategy' do
    assert_difference('Strategy.count', -1) do
      delete strategy_url(@strategy_one)
    end

    assert_redirected_to strategies_url
  end
end
