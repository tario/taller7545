class Feature < ActiveRecord::Base
  has_many :pre_registrations, :through => :pre_registration_features
  has_many :pre_registration_features
end
