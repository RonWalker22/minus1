class AssignObjectiveJob < ApplicationJob
  queue_as :default

  def perform(room, user)
    strategy = room.strategy
    op_num = room.users.where(online: true).count + 1
    user.current_objective_id = strategy.assignment_flow[op_num]
    user.save
    UserChannel.broadcast_to user, 
                             objective_preload: user.current_objective.uuid
  end
end
