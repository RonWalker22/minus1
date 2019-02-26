class RoomsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast "rooms:#{room.to_gid_param}",
                                 room: room.name
  end
end
