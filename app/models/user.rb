require 'bcrypt'

class User
	include Mongoid::Document

	attr_accessor :password, :password_confirmation

	field :name, type: String
	field :email, type: String
	field :fish, type: String
	field :salt, type: String

	before_save :encrypt_password

	def authenticate(password)
		if self.fish == self.fish = BCrypt::Engine.hash_secret(password, self.salt)
			self
		else
			nil
		end
	end

	private

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.fish = BCrypt::Engine.hash_secret(password, self.salt)
			self.password = nil
		end
	end
end