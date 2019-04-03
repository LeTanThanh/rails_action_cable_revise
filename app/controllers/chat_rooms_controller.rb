class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.includes(:owner)
  end

  def new
    @chat_room = current_user.chat_rooms.new
  end
  
  def create
    @chat_room = current_user.chat_rooms.new chat_room_params

    if @chat_room.save
      flash.now[:success] = "Chat Room is created"
      redirect_to root_url
    else
      flash.now[:danger] = "Chat room isn't created"
      render :new
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit :name
  end
end
