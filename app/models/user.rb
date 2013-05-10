require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :email, :is_admin, :password, :password_confirmation, :code, :expires_at
  
  field :email, type: String
  field :is_admin, type: Boolean, default: false
  
  field :hash, type: String
  field :salt, type: String
  
  field :code, type: String
  field :expires_at, type: DateTime
  
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  
  before_validation :downcase_email
  before_save :encrypt_password
  
  private
  
  def downcase_email
    self.email.downcase!
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hash = BCrypt::Engine.hash_secret(password, self.salt)
      self.password = nil
    end
  end
end
