class RoomsChannel < ApplicationCable::Channel
  def subscribed
    op_name = current_operator.name
    room = current_operator.room
    stream_for room
    moving_speech(room, op_name, 'joiner')
    AssignObjectiveJob.perform_later(room, current_operator)
  end

  def unsubscribed
    op_name = current_operator.name
    room = current_operator.room
    moving_speech(room, op_name, 'leaver')
  end

  def objective_completed(data)
    room = current_operator.room
    objective = data['objective']
    RoomsChannel.broadcast_to room, objective_completed: objective
  end

  def scramble_objectives
    ScrambleObjectivesJob.perform_later(current_operator.room)
  end

  private

    def moving_speech(room, operator_name, kind)
      RoomsChannel.broadcast_to room, kind => operator_name
    end
end
