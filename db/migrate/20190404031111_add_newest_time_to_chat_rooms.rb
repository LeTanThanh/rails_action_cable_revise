class AddNewestTimeToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :newest_time, :datetime
  end
end
