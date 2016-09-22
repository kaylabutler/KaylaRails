require 'rails_helper'

describe UsersController, :type => :controller do

	before do
		#@user = User.create!(first_name: "Stupid", last_name: "Dummy", email: "imastupiddummy@testing.org", password: "Password123")
		@user = FactoryGirl.create(:user)
	end

	describe 'GET #show' do
		context 'User is logged in' do
			before do
				sign_in @user

		end

		it "loads correct user details" do
			get :show, id: @user.id
			expect(response).to have_http_status(200)
			expect(assigns(:user)).to eq @user
		end

	end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: @user.id
				expect(response).to redirect_to('/login')
			end
		end
	end
end