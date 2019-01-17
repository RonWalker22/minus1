require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  level = Level.all[random_index]
  test 'has game' do
    assert_equal 'Game', level.game.class.name
  end

  test 'disallows new levels with existing name && game_id combo' do
    begin
      Level.create!(name: 'DG', game_id: Game.second.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
  test 'has strategies' do
    assert_equal 'Strategy', level.strategies.first.class.name
  end
end
