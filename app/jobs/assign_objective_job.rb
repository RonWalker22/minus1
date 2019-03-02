class AssignObjectiveJob < ApplicationJob
  queue_as :default

  def perform(room, operator)
    strategy = room.strategy
    op_num = room.operators.where(online: true).count + 1
    operator.current_objective_id = strategy.assignment_flow[op_num]
    operator.save
    objective = operator.current_objective.action + ' ' + operator.current_objective.target.name
    OperatorChannel.broadcast_to operator, objective: objective
  end
end
