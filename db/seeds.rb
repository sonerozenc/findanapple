User.destroy_all

user = User.create email: "joe@example.com", password: "123", password_confirmation: "123"