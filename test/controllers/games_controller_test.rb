require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @game = games(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get games_url
    assert_response :success
  end

  test 'should get new' do
    get new_game_url
    assert_response :success
  end

  test 'should create game' do
    assert_difference('Game.count') do
      post games_url, params: { game: { name: 'game88', website: 'www.88.com' } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test 'should show game' do
    get game_url(@game)
    assert_response :success
  end

  test 'should get edit' do
    get edit_game_url(@game)
    assert_response :success
  end

  test 'should update game' do
    patch game_url(@game), params: { game: { name: 'new game' } }
    assert_redirected_to game_url(@game)
  end
end
