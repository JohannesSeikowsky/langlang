class User < ActiveRecord::Base

  # downcasing email before save
  before_save { self.email = email.downcase }

  # saving of password based on password provided by the user on form
  attr_accessor :password_provided
  before_save :password_encrypt

  # validations
  validates :email, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
  validates :password_provided, presence: true, length: { minimum: 6 }


  def password_encrypt
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password_provided, password_salt)
  end

  def check_password(password_provided)
    BCrypt::Engine.hash_secret(password_provided, self.password_salt) == self.password
  end

end
