require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get patient_or_doctor" do
    get :patient_or_doctor
    assert_response :success
  end

  test "should get new_patient" do
    get :new_patient
    assert_response :success
  end

  test "should get new_doctor" do
    get :new_doctor
    assert_response :success
  end

end
