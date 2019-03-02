class ScrambleObjectivesJob < ApplicationJob
  queue_as :default

  def perform(room)
    assignments = room.strategy.assignment_flow
    room.operators.where(online: true).shuffle.each_with_index do |operator, i|
      operator.current_objective_id = assignments[i]
      operator.save
      new_objective = current_operator.current_objective.action + ' ' + current_operator.current_objective.target.name
      OperatorChannel.broadcast_to operator, new_objective: new_objective
    end
  end
end
