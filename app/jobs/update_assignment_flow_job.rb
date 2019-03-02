class UpdateAssignmentFlowJob < ApplicationJob
  queue_as :default

  def perform(strategy)
    objectives = strategy.objectives.order(:priority)
    assignment_flow = []
    new_objs = []

    objectives.uniq(&:priority).map(&:priority).each do |num|
      new_objs << objectives.select do |obj|
        obj.priority == num
      end
    end

    new_objs.each do |objs|
      max_min_ops = objs.max_by(&:min_ops).min_ops
      max_min_ops.times do |i|
        objs.each do |obj|
          next if i + 1 > obj.min_ops

          assignment_flow << obj.id
        end
      end
    end

    max_max_ops = objectives.max_by(&:max_ops).max_ops
    max_max_ops.times do |i|
      objectives.each do |obj|
        next if i + 1 + obj.min_ops > obj.max_ops

        assignment_flow << obj.id
      end
    end

    strategy.update_attributes assignment_flow: assignment_flow
  end
end
