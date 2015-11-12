require "test_helper"

class OldPrescriptionsAppearOnPatientsIndexTest < Capybara::Rails::TestCase
  setup do
    pat = Patient.create! email: "jd@example.com",
                          first_name: "Jane",
                          last_name: "Doe",
                          password: "12345678",
                          insurer: "Humana"

    doc = Doctor.create! email: "doc@doctors.com",
                         first_name: "Jane",
                         last_name: "Doe",
                         password: "12345678",
                         specialty: "Family Medicine"

    prescrip2 = Prescription.create! initial_amount_of_pills: 2,
                                     length_of_prescription: 30,
                                     max_dose_amount: 4,
                                     doctor_id: doc.id,
                                     patient_id: pat.id,
                                     drug_name: "Lipitor",
                                     purpose: "To prevent heart attacks and stroke",
                                     instructions: "Take right after eating breakfast and dinner",
                                     doses_per_day: 2

    visit root_path

    click_link "I am a patient"

    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link 'Lipitor'

    click_link 'Add New Dose'

    select '2', from: 'Amount of pills taken'
    select '5', from: 'Pain scale'

    click_button "Add Dose"

    click_link "Jane"
  end

  test "Patient can view old prescriptions" do
    assert_content page, "Your Old Prescriptions"
  end

  test "Patient will not see old prescriptions under current prescriptions" do
    refute_content page, "Your Current Prescriptions"
  end

  test "Patient can go to show page for old prescription" do
    save_and_open_page
    click_link 'Old Lipitor'

    assert_content page, "Your Old Lipitor Prescription"
  end

end
