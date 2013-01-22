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
      raise SecurityError, "User password #{password.gsub(/./,"*")} does not match"
    end
  end

  
  def self.authorize(email_username, password)
    user = User.find_by_name(email_username) || User.find_by_email(email_username)
    if user
      if user.validate_password(password)
        user
      end
    else
      raise SecurityError, "User of name or email '#{email_username}' not found in database"
    end
  end
end
