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

  def active_navbar request_path, active_paths
    "active" if active_paths.include?(request_path)
  end
end
