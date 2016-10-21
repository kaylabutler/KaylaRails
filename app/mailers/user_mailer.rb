class UserMailer < ApplicationMailer
	default from: "kaylabutler.violin@yahoo.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'kaylabutler.violin@yahoo.com',
			:subject => "A new contact form message from #{name}")
	end
end
