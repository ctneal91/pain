require "test_helper"

class PatientCanSignUpTest < Capybara::Rails::TestCase
  test "_atient Can Sign Up" do
    visit root_path

    click_link "I am a patient"

    click_link "create an account"

    fill_in "First Name", with: "Christian"
    fill_in "Last Name", with: "Neal"
    fill_in "Insurer", with: "Humana"
    fill_in "Email", with: "neal@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password Confirmation", with: "12345678"

    click_button "Sign Up"

    assert_content page, "Hello, Christian"
  end
end
