class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    user = message.user

    ActionCable.server.broadcast "chat_room_#{message.chat_room_id}_channel",
      user_id: user.id, 
      user_message: user_message(message, user),
      other_user_message: other_user_message(message, user),
      chat_room_with_newest_message: chat_room_with_newest_message(message)
  end

  private

  def user_message message, user
    ApplicationController.render partial: "chat_rooms/user_message",
      locals: { message: message, user: user }
  end

  def other_user_message message, user
    ApplicationController.render partial: "chat_rooms/other_user_message",
      locals: { message: message, user: user }
  end

  def chat_room_with_newest_message message
    ApplicationController.render partial: "chat_rooms/chat_room_with_newest_message",
      locals: {chat_room: message.chat_room, message: message }
  end
end
