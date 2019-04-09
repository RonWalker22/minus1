require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @strategy = strategies(:one)
    @game = games(:one)
  end

  test 'commands a room' do
    assert_equal 'Room', @user.commander_seats.first.class.name
  end

  test 'has a room' do
    assert_equal 'Room', @user.rooms.first.class.name
  end

  test 'has stratgies' do
    assert_equal 'Strategy', @user.strategies.first.class.name
  end

  test 'commands a strategy' do
    assert_equal 'Strategy', @user.commander_strategies.first.class.name
  end

  test 'has recipes' do
    assert_equal 'Recipe', @user.recipes.first.class.name
  end

  test 'commands a recipe' do
    assert_equal 'Recipe', @user.commander_recipes.first.class.name
  end

  test 'has teams' do
    assert_equal 'Team', @user.teams.first.class.name
  end

  test 'commands a team' do
    assert_equal 'Team', @user.commander_teams.first.class.name
  end

  test 'disallows new Users with existing name' do
    begin
      User.create!(name: 'Ron')
    rescue ActiveRecord::RecordNotUnique => invalid
    rescue ActiveRecord::RecordInvalid => invalid
    end
    assert invalid
  end

  test 'has game setting id' do
    @user.game_setting_id = @game.id
    game_setting = @user.game_setting_id
    assert game_setting.is_a?(Integer) && !game_setting.zero?
  end
end
