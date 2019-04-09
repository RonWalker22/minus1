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

  def scramble_objectives
    ScrambleObjectivesJob.perform_later(current_user.room)
  end

  private

    def moving_speech(room, user_name, kind)
      RoomsChannel.broadcast_to room, kind => user_name
    end
end
