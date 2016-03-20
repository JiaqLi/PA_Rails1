require "test_helper"

class EnrollmentTest < ActiveSupport::TestCase
  def enrollment
    @enrollment ||= Enrollment.new
  end

  def test_valid
    assert enrollment.valid?
  end
end
