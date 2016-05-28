class User < ActiveRecord::Base

  # validations
  validates_uniqueness_of :email
  validates_presence_of :email, :password_provided
  validates_length_of :email, :password_provided, minimum: 6

  # rather than saving the provided password directly in db, we generate a secure password_hash for each user
  attr_accessor :password_provided
  before_save :password_encrypt

  def password_encrypt
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password_provided, password_salt)
  end

  def check_password(password_provided)
    BCrypt::Engine.hash_secret(password_provided, self.password_salt) == self.password
  end

end
