require 'rails_helper'

describe Product do 
	context "when the product has comments" do
end

before do
	@product = Product.create!(name: "beautiful painting", image_url: "http://kaylarails.herokuapp.com/assets/painting5", price: "900", description: "omg wow", color: "Magenta")
	@user = User.create!(first_name: "Carl", last_name: "Grimes", email: "coralgrimes@test.test", password: "Password1!")
	@product.comments.create!(rating: 1, user: @user, body: "This is not beautiful! This is garbage!")
	@product.comments.create!(rating: 3, user: @user, body: "I changed my mind. It's okay.")
	@product.comments.create!(rating: 5, user: @user, body: "Whoa! This painting gets better and better every time I look at it.")
end

it "returns the average rating of all comments" do
	expect(@product.comments.average(:rating).to_i).to eq 3

end

it "is not valid" do
	expect(Product.new(description: "asdf")).not_to be_valid
end
	
end