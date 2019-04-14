class RoomsChannel < ApplicationCable::Channel
  def subscribed
    op_name = current_user.name
    room = current_user.room
    stream_for room
    moving_speech(room, op_name, 'joiner')
    AssignObjectiveJob.perform_later(room, current_user)
  end

  def unsubscribed
    op_name = current_user.name
    room = current_user.room
    moving_speech(room, op_name, 'leaver')
  end

  def objective_completed(data)
    room = current_user.room
    objective = data['objective']
    RoomsChannel.broadcast_to room, objective_completed: objective
  end

  def minus_one(data)
    room = current_user.room
    room.increment!(kill_counter, by = 1)
    objective = data['objective']
    RoomsChannel.broadcast_to room, kill_counter: room.kill_counter
  end

  def execute_strategy
    room = current_user.room
    return unless room.commander_id == current_user.id
    room.update_attributes kill_counter: 0, active: true
    RoomsChannel.broadcast_to room, execute_strategy: true
  end

  def scramble_objectives
    ScrambleObjectivesJob.perform_later(current_user.room)
  end

  private

    def moving_speech(room, user_name, kind)
      RoomsChannel.broadcast_to room, kind => user_name
    end
end
