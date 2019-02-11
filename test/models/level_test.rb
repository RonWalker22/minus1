require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  setup do
    @level = levels(:one)
    @operator = operators(:one)
  end

  test 'has game' do
    assert_equal 'Game', @level.game.class.name
  end

  test 'disallows new levels with existing name && game_id combo' do
    begin
      Level.create!(name: @level.name,
                    game_id: @level.game_id,
                    operator_id: @operator.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
