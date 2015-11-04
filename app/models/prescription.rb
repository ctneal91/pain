class Prescription < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :drug
  has_many :doses

  def remaining_amount_of_pills
    initial_amount_of_pills
  end
end
