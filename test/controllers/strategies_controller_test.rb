require 'test_helper'

class StrategiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @strategy = strategies(:one)
    @mode = modes(:one)
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
      post strategies_url, params: { strategy: { name: 'G2',
                                                 mode_id: @mode.id } }
    end

    assert_redirected_to strategy_url(Strategy.last)
  end

  test 'should show strategy' do
    get strategy_url(@strategy)
    assert_response :success
  end

  test 'should get edit' do
    get edit_strategy_url(@strategy)
    assert_response :success
  end

  test 'should update strategy' do
    patch strategy_url(@strategy), params: { strategy: { name: 'G44' } }
    assert_redirected_to strategy_url(@strategy)
  end

  test 'should destroy strategy' do
    assert_difference('Strategy.count', -1) do
      delete strategy_url(@strategy)
    end

    assert_redirected_to strategies_url
  end
end
