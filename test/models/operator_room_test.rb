require 'test_helper'

class OperatorRoomTest < ActiveSupport::TestCase
  setup do
    @operator = operators(:one)
    @room = rooms(:one)
  end

  test 'disallows duplicate OperatorRooms' do
    begin
      OperatorRoom.create!(operator_id: @operator.id,
                           room_id: @room.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end

  test 'has an Objective' do
    assert_equal 'Objective', OperatorRoom.first.objective.class.name
  end
end
