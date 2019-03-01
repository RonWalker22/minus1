class RoomsChannel < ApplicationCable::Channel
  def subscribed
    op_name = current_operator.name
    room = current_operator.room.to_gid_param
    current_operator.online = true
    current_operator.save
    stream_for room
    moving_speech(room, op_name, 'joiner')
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_operator.online = false
    current_operator.save
    op_name = current_operator.name
    room = current_operator.room.to_gid_param
    moving_speech(room, op_name, 'leaver')
  end

  def objective_completed(data)
    room = current_operator.room.to_gid_param
    objective = data['objective']
    ActionCable.server.broadcast "rooms:#{room}", objective_completed: objective
  end

  private

    def moving_speech(room, operator_name, kind)
      ActionCable.server.broadcast "rooms:#{room}", kind => operator_name
    end
end
