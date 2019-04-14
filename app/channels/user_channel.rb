class UserChannel < ApplicationCable::Channel
  def subscribed
    current_user.update_attributes online: true
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.update_attributes online: false
  end
end
