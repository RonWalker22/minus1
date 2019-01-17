require 'test_helper'

class GameTest < ActiveSupport::TestCase
  game = Game.all[random_index]
  test 'has levels' do
    assert_equal 'Level', game.levels.first.class.name
  end
  test 'disallows new game with same URL' do
    begin
      Game.create!(name: 'SOCOM2', website: 'socom.com')
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
