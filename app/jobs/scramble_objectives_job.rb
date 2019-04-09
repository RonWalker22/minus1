class ScrambleObjectivesJob < ApplicationJob
  queue_as :default

  def perform(room)
    assignments = room.strategy.assignment_flow
    room.users.where(online: true).shuffle.each_with_index do |user, i|
      user.current_objective_id = assignments[i]
      user.save
      new_objective = current_user.current_objective.action + ' ' + current_user.current_objective.target.name
      UserChannel.broadcast_to user, new_objective: new_objective
    end
  end
end
