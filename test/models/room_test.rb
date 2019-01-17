require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  room = Room.all[random_index]
  test 'room has commander' do
    assert_equal 'Operator', room.commander.class.name
  end

  test 'room has operators' do
    assert_equal 'Operator', room.operators.first.class.name
  end
end
