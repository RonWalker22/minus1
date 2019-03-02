class OperatorChannel < ApplicationCable::Channel
  def subscribed
    current_operator.online = true
    current_operator.save
    stream_for current_operator
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_operator.online = false
    current_operator.save
  end
end
