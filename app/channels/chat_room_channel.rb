class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:chat_room_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive_message data
    action_cable_current_user.messages.create chat_room_id: data["chat_room_id"], content: data["message_content"]
  end
end
