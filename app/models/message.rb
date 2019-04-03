class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  scope :newest, -> { order(id: :desc, created_at: :desc) }
end
