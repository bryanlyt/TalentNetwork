module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages =
      resource.errors.full_messages.map { |msg| alert(msg, type: :error) }.join
    messages.html_safe
  end
end
