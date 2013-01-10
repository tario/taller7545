class PreRegistration < ActiveRecord::Base
  has_many :features, :through => :pre_registration_features
  has_many :pre_registration_features
end
