require "test_helper"

class DrugTest < ActiveSupport::TestCase
  def drug
    @drug ||= Drug.new
  end

  def test_valid
    assert drug.valid?
  end
end
