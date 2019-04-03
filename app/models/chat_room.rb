class ChatRoom < ApplicationRecord
  belongs_to :owner, class_name: User.name, foreign_key: "user_id"
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  scope :newest, -> { order(id: :desc, created_at: :desc) }
end
