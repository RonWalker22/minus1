require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  room = Room.all[random_index]
  test 'room has commander' do
    assert_equal 'User', room.commander.class.name
  end

  test 'room has users' do
    assert_equal 'User', room.users.first.class.name
  end
end
