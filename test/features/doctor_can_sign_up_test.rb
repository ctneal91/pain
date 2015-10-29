require "test_helper"

class DoctorCanSignUpTest < Capybara::Rails::TestCase
  test "Doctor Can Sign Up" do
    visit root_path

    click_link "I am a doctor"

    click_link "create an account"

    fill_in "First Name", with: "Christian"
    fill_in "Last Name", with: "Neal"
    fill_in "Speciality", with: "Family Medicine"
    fill_in "Email", with: "neal@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password Confirmation", with: "12345678"

    click_button "Sign Up"

    assert_content page, "Hello, Dr. Neal"
  end
end
