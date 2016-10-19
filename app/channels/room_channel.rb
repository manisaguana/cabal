class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from 'room_channel'

    current_user.update_attribute :is_online, true
    OnlineUserBroadcastJob.perform_later current_user
  end

  def unsubscribed
    current_user.update_attribute :is_online, false 
    ActionCable.server.broadcast 'room_channel', offline_user: current_user.id
  end

  def speak(data)
    Message.create content: data['message'], user_id: current_user.id
  end
end
