class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  
  def validate_password(password)
    if Digest::MD5.hexdigest(password) == self.password
      true
    else
      raise SecurityError, "User password does not match"
    end
  end
  
  def self.authorize(name, password)
    user = User.find_by_name(password)
    if user
      if user.validate_password(password)
        user
      end
    else
      raise SecurityError, "User #{name} not found in database"
    end
  end
end
