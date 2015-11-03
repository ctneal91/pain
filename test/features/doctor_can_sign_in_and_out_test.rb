require "test_helper"

class DoctorCanSignInAndSignOutTest < Capybara::Rails::TestCase

  setup do
    doc = Doctor.create! email: "doc@doctors.com",
                         first_name: "Jane",
                         last_name: "Doe",
                         password: "12345678",
                         specialty: "Family Medicine"
    visit root_path

  end

  test "Log in and log out as doctor" do
    assert_content page, "Sign In"

    click_link "I am a doctor"
    assert_content page, "Doctor Sign In"

    fill_in "Email", with: "doc@doctors.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content "Hello, Dr. Doe"

    click_link "Sign Out"

    assert_content page, "Sign In"
  end
end
