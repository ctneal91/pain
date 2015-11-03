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
    assert_content page, "Welcome to Pain Shield.  Please sign in."

    click_link "I am a doctor"
    assert_content page, "Welcome!  Here at Pain Shield we are dedicated to helping your patients regulate their short-term and chronic pain needs."

    fill_in "Email", with: "doc@doctors.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content "Hello, Dr. Doe"

    click_link "Sign Out"

    assert_content page, "Welcome to Pain Shield.  Please sign in."
  end
end
