if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_DjaU9mzX0PnYAHSy8rCGkKz3',
		:secret_key => 'sk_test_pzGRCLgkGD7UhTKVqMGSeQEj'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]