class ChatRoom < ApplicationRecord
  belongs_to :owner, class_name: User.name, foreign_key: "user_id"
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  after_create :update_newest_time

  scope :newest, -> { order(newest_time: :desc, id: :desc) }

  private

  def update_newest_time
    update_attributes newest_time: created_at
  end
end
