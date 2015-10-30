class Prescription < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :drug
  has_many :doses
end
