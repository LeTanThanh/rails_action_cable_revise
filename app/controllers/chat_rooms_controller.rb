class ChatRoomsController < ApplicationController
  before_action :load_chat_room, only: %i|show|

  def index
    @chat_rooms = ChatRoom.includes(:owner)
  end

  def new
    @chat_room = current_user.chat_rooms.new
  end
  
  def create
    @chat_room = current_user.chat_rooms.new chat_room_params

    if @chat_room.save
      flash[:success] = "Chat Room is created"
      redirect_to root_url
    else
      flash.now[:danger] = "Chat room isn't created"
      render :new
    end
  end

  def show
    @chat_rooms = ChatRoom.newest
    @messages = @chat_room.messages
  end

  private

  def chat_room_params
    params.require(:chat_room).permit :name
  end

  def load_chat_room
    @chat_room = ChatRoom.find_by id: params[:id]
    return if @chat_room

    flash[:danger] = "Chat Room isn't found"
    redirect_to root_url
  end
end
