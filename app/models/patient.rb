class Patient < ActiveRecord::Base
  has_secure_password
  has_many :prescriptions
  has_many :doctors, through: :prescriptions
  has_many :visits

  def full_name
    first_name + " " + last_name
  end
end
