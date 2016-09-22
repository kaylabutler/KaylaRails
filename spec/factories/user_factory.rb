FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		email
		password "1234567890"
		first_name "Stupid"
		last_name "Dummy"
		admin false
	end

	factory :admin, class: User do
		email
		password "Password123"
		first_name "Carol"
		last_name "Peletier"
		admin true
	end

end