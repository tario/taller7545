class PreRegistration < ActiveRecord::Base
  has_many :features, :through => :pre_registration_features
  has_many :pre_registration_features
  
  before_save :check_confirm_token
  
  def generate_confirm_token
    (0...64).map{ ('0123456789ABCDEF').split('')[rand(16)] }.join
  end
  
  def check_confirm_token
    unless self.confirm_token
      self.confirm_token = generate_confirm_token()
      self.confirmed = false
      UserMailer.prereg_mail(self)
    end
  end
end
