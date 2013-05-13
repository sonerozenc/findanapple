require 'spec_helper'

describe UsersController do
	let (:users) {
		UsersController.new
	}

	let (:user_1) {
		User.create(
			name: "Pedro",
			email: "pedro@gmail.com",
			password: "123"
		)
	}

	let (:user_2) {
		User.create(
			name: "Kim",
			email: "kim@gmail.com",
			password: "456"
		)
	}

	let (:user_3) {
		User.create(
			name: "Toby",
			email: "toby@gmail.com",
			password: "789"
		)
	}

	describe ".index" do
		it "should set an array of users in @users" do
			users.index
			expect(users.users).to match_array [user_1, user_2, user_3]
		end
	end
end