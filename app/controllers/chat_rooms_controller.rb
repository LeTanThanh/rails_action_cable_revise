class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.includes(:owner)
  end
end
