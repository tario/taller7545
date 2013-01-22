class User < ActiveRecord::Base
  attr_accessible :email, :name
  attr_accessor :plain_password
  
  before_save :encrypt_password
  
  def self.create(arguments)
    User.new(:name => arguments[:name], :email => arguments[:email]).tap do |u|
      u.plain_password = arguments[:password]
      u.save!
    end
  end
  
  def encrypt_password
    if self.plain_password
      self.password = Digest::MD5.hexdigest(self.plain_password)
    end
  end
  
  def validate_password(password)
    if Digest::MD5.hexdigest(password) == self.password
      true
    else
      raise SecurityError, "User password does not match"
    end
  end

  
  def self.authorize(name, password)
    user = User.find_by_name(name)
    if user
      if user.validate_password(password)
        user
      end
    else
      raise SecurityError, "User #{name} not found in database"
    end
  end
end
