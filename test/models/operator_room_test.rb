require 'test_helper'

class OperatorRoomTest < ActiveSupport::TestCase
  test 'disallows duplicate OperatorRooms' do
    begin
      OperatorRoom.create!(operator_id: Operator.first.id,
                           room_id: Room.first.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end

  test 'has an Objective' do
    assert_equal 'Objective', OperatorRoom.first.objective.class.name
  end
end
