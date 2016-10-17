class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from 'room_channel'
    OnlineUserBroadcastJob.perform_later current_user 
  end

  def unsubscribed
  end

  def speak(data)
    Message.create content: data['message'], user_id: current_user.id
  end
end
