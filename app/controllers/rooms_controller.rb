class RoomsController < ApplicationController
  def show
    @messages = Message.all
    @users    = User.where is_online: true
  end
end
