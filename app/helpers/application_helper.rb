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
end
