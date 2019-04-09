class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  after_commit :broadcast_message
  after_commit :update_chat_room_newest_time

  scope :newest, -> { order(id: :desc, created_at: :desc) }

  private 

  def broadcast_message
    MessageBroadcastJob.perform_later self
  end

  def update_chat_room_newest_time
    chat_room.update_attributes newest_time: created_at
  end
end
