module MessagesHelper
	def recipients_options(chosen_recipient = nil)
  	s = ''
  	User.all.each do |user|
    	s << "<option value='#{user.id}' #{'selected' if user == chosen_recipient}>#{user.to_s}</option>"
  	end
  	s.html_safe
	end
end

# data-img-src='#{gravatar_image_url(user.email, size: 50)}' 