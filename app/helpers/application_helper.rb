module ApplicationHelper
  def flash_messages
    message_divs = []
    [:error, :notice].each do |key|
      next unless massage = flash[key]
      message_p = content_tag(:p, massage, class: key)
      message_divs << content_tag(:div, message_p, class: "message")
    end
    flash.clear # Защита для того, чтобы не вывести flash дважды
    content_tag(:div, message_divs.join('').html_safe, id: "flash_messages")
  end
end
