require "test_helper"

class PrescriptionTest < ActiveSupport::TestCase
  def prescription
    @prescription ||= Prescription.new
  end

  def test_valid
    assert prescription.valid?
  end
end
