class UserMailer < ApplicationMailer
	default from: "from@example.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'kaylabutler.violin@yahoo.com',
			:subject => "A new contact form message from #{name}")
	end

		def send_welcome_email(user)
		@appname = 'Painting With Ruby'
		mail(:to => user.email,
			:subject => "Hello, and thank you for signing up to #{@appname}! ")
	end
end
