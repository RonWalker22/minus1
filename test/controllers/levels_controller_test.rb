require 'test_helper'

class LevelsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include AuthorizationTests
  setup do
    @user = users(:one)
    @level = @record = levels(:one)
    @level_two = @record = levels(:two)
    @game = games(:one)
    sign_in @user
  end

  test 'should create level' do
    assert_difference('Level.count') do
      post levels_url, params: { level: { name: 'level77', game_id: @game.id } }
    end
  end

  test 'should not create level' do
    assert_difference('Level.count') do
      post levels_url, params: { level: { name: 'level77', game_id: @game.id } }
    end
  end

  test 'should get edit' do
    get edit_level_url(@level)
    assert_response :success
  end

  test 'should update level' do
    patch level_url(@level), params: { level: { name: 'new level' } }
  end

  test 'should destroy level' do
    assert_difference('Level.count', -1) do
      delete level_url(@level)
    end
  end
end
