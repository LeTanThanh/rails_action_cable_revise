module ApplicationHelper
  def alert_type type
    case type.to_s
    when "alert"
      "danger"
    when "notice"
      "success"
    else
      type.to_s
    end
  end

  def active_chat_room chat_room_id, current_chat_room_id
    "active_chat" if chat_room_id == current_chat_room_id
  end
end
