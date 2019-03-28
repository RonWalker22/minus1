require 'test_helper'

class OperatorTest < ActiveSupport::TestCase
  setup do
    @operator = operators(:one)
    @strategy = strategies(:one)
    @game = games(:one)
  end

  test 'commands a room' do
    assert_equal 'Room', @operator.commander_seats.first.class.name
  end

  test 'has a room' do
    assert_equal 'Room', @operator.rooms.first.class.name
  end

  test 'has stratgies' do
    assert_equal 'Strategy', @operator.strategies.first.class.name
  end

  test 'commands a strategy' do
    assert_equal 'Strategy', @operator.commander_strategies.first.class.name
  end

  test 'has recipes' do
    assert_equal 'Recipe', @operator.recipes.first.class.name
  end

  test 'commands a recipe' do
    assert_equal 'Recipe', @operator.commander_recipes.first.class.name
  end

  test 'has teams' do
    assert_equal 'Team', @operator.teams.first.class.name
  end

  test 'commands a team' do
    assert_equal 'Team', @operator.commander_teams.first.class.name
  end

  test 'disallows new Operators with existing name' do
    begin
      Operator.create!(name: 'Ron')
    rescue ActiveRecord::RecordNotUnique => invalid
    rescue ActiveRecord::RecordInvalid => invalid
    end
    assert invalid
  end

  test 'has game setting id' do
    @operator.game_setting_id = @game.id
    game_setting = @operator.game_setting_id
    assert game_setting.is_a?(Integer) && !game_setting.zero?
  end
end
