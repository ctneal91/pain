require "test_helper"

class PatientCanAddDoseTest < Capybara::Rails::TestCase
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

    prescrip = Prescription.create! initial_amount_of_pills: 60,
                                    length_of_prescription: 30,
                                    max_dose_amount: 5,
                                    doctor_id: doc.id,
                                    patient_id: pat.id,
                                    drug_name: "Zyrtec",
                                    purpose: "To prevent hay fever",
                                    instructions: "Take right before bed",
                                    doses_per_day: 1

    prescrip2 = Prescription.create! initial_amount_of_pills: 50,
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

    click_link 'Zyrtec'
  end

  test "Can Add Dose from Prescription Page" do

    click_link 'Add New Dose'

    assert_content page, 'Please enter in your dose information here'

    select '3', from: 'Amount of pills taken'
    select '5', from: 'Pain scale'

    click_button "Add Dose"

    assert_content page, "3"
    assert_content page, "5"
  end

  test "Patient 'Add Dose' changes remaining amount of pills" do
    click_link 'Add New Dose'

    select '3', from: 'Amount of pills taken'
    select '5', from: 'Pain scale'

    click_button "Add Dose"

    assert_content page, "Remaining Amount: 57"
  end
end
