class SendEmailJob < ActiveJob::Base
	queue_as :default

	def perform(user, talent)
		UserMailer.talent_application_confirmation(user, talent).deliver_now
	end
end
