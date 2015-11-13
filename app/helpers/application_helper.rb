module ApplicationHelper
  ALERT_TYPES = {
    notice: :info,
    error: :danger,
    success: :success,
    alert: :warning
  }

  def alert(message, opts = {})
    type = opts[:type] || :notice

    content_tag(:div, class: "alert alert-#{ALERT_TYPES[type]} fade in") do
      concat message
      concat close_tag
    end
  end

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  # def gravatar_for(user, size = 30)
  #   image_tag gravatar_image_url(user.email, size: size)
  # end

  private
  def close_tag
    content_tag :div, '&times;'.html_safe,
                class: 'close', data: { dismiss: :alert }
  end
end
