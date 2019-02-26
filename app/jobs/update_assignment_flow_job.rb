class UpdateAssignmentFlowJob < ApplicationJob
  queue_as :default

  def perform(strategy)
    objectives = strategy.objectives.order(:priority).pluck(:priority, :min_ops, :max_ops, :id)
    assignment_flow = []
    new_objs = []

    objectives.uniq { |obj| obj[0] }.map(&:first).each do |num|
      new_objs << objectives.select do |obj|
        obj[0] == num
      end
    end

    new_objs.each do |objs|
      max_min_ops = objs.max_by { |obj| obj[1] }[1]
      max_min_ops.times do |i|
        objs.each do |obj|
          next if i + 1 > obj[1]

          assignment_flow << obj[3]
        end
      end
    end

    max_max_ops = objectives.max_by { |obj| obj[2] }[2]
    max_max_ops.times do |i|
      objectives.each do |obj|
        next if i + 1 + obj[1] > obj[2]

        assignment_flow << obj[3]
      end
    end

    strategy.update_attributes assignment_flow: assignment_flow
  end
end
