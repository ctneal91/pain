class Patient < ActiveRecord::Base
  has_secure_password
  has_many :prescriptions
end
