class OnlineUserBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user)
    ActionCable.server.broadcast 'room_channel', user: render_user(user) 
  end

  private
    
    def render_user(user)
      puts user.username
      puts user.username
      puts user.username
      puts user.username
      puts user.username
      puts user.username
      puts user.username
      puts user.username
      puts user.username
      ApplicationController.renderer.render(partial: 'sidebar/online_user', locals: { user: user })
    end

end
