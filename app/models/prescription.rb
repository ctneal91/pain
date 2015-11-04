class Prescription < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :drug
  has_many :doses

  def remaining_amount_of_pills
    total_taken = doses.map{|dose| dose.amount_of_pills_taken}.sum
    initial_amount_of_pills - total_taken
  end
end
