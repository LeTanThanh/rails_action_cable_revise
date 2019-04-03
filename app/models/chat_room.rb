class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :chat_room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
