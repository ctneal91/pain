require "test_helper"

class PatientCanSignInTest < Capybara::Rails::TestCase
  test "Can login as patient" do
    visit root_path
    patient = Patient.create! email: 'example@example.com',
                              first_name: "Juan",
                              last_name: "Doe",
                              password: "12345678",
                              insurer: "Health Insurance, USA"

    click_link "I am a patient"

    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Hello, Juan"
  end
end
