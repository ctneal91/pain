require "test_helper"

class DoctorCanSignInTest < Capybara::Rails::TestCase
  test "Log in as doctor" do
    visit root_path
    assert_content page, "Welcome to Pain Shield.  Please sign in."

    doc = Doctor.create! email: "doc@doctors.com",
                         first_name: "Jane",
                         last_name: "Doe",
                         password: "12345678",
                         speciality: "Family Medicine"

    click_link "I am a doctor"
    assert_content page, "Welcome!  Here at Pain Shield we are dedicated to helping your patients regulate their short-term and chronic pain needs."

    fill_in "Email", with: "doc@doctors.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content "Hello, Dr. Doe"

  end
end
