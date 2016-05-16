class User < ActiveRecord::Base

  def check_password(pass)
    self.password == pass
  end

end
