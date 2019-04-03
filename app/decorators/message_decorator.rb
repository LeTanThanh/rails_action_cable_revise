class MessageDecorator < ApplicationDecorator
  def short_format_created_at
    created_at.strftime("%d %b %Y")
  end

  def long_format_created_at
    created_at.strftime("%l:%M %p | %d %b %Y")
  end
end
