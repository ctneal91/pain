class Patient < ActiveRecord::Base
  has_secure_password
  has_many :prescriptions

  def full_name
    patient.first_name + " " + patient.last_name
  end
end
