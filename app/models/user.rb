class User < ActiveRecord::Base

  attr_accessor :password_provided
  before_save :password_encrypt

  def password_encrypt
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password_provided, password_salt)
  end

  def check_password(password_provided)
    # check whether the provided password checks out
    BCrypt::Engine.hash_secret(password_provided, self.password_salt) == self.password
  end

end
