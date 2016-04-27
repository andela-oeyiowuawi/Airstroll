module ApplicationHelper
  def custom_bootstrap_flash
  flash_messages = []
  flash.each do |type, message|
    type = 'success' if type == 'notice'
    type = 'danger'   if type == 'alert'
    text = "<script> $.toaster('#{message}', '#{type.capitalize}', '#{type}');</script>"
    flash_messages << text.html_safe if message
  end
  flash_messages.join("\n").html_safe
end
end
