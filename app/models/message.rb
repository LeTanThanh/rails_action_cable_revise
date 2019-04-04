class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  after_commit :broadcast_message

  scope :newest, -> { order(id: :desc, created_at: :desc) }

  private 

  def broadcast_message
    MessageBroadcastJob.perform_later self
  end
end
