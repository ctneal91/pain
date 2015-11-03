class Patient < ActiveRecord::Base
  has_secure_password
  has_many :prescriptions

  def full_name
    first_name + " " + last_name
  end
end
