require "test_helper"

class LowWarningShowsIfRemainingAmountLowTest < Capybara::Rails::TestCase
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

    prescrip = Prescription.create! initial_amount_of_pills: 15,
                                    length_of_prescription: 30,
                                    max_dose_amount: 5,
                                    doctor_id: doc.id,
                                    patient_id: pat.id,
                                    drug_name: "Zyrtec",
                                    purpose: "To prevent hay fever",
                                    instructions: "Take right before bed",
                                    doses_per_day: 1

    dose1 = Dose.create! amount_of_pills_taken: 2,
                         pain_scale: 5,
                         prescription_id: prescrip.id

    dose2 = Dose.create! amount_of_pills_taken: 2,
                         pain_scale: 4,
                         prescription_id: prescrip.id

    visit root_path

    click_link "I am a patient"

    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"
    click_link "Zyrtec"

  end

  test "Low warning won't show unless remaining_amount_of_pills <= 10" do
    refute_content page, "Warning:"
  end

  test "Low warning will show if remaining_amount_of_pills < 10" do
    click_link 'Add New Dose'

    assert_content page, 'Please enter in your dose information here'

    select '1', from: 'Amount of pills taken'
    select '2', from: 'Pain scale'

    click_button "Add Dose"

    assert_content page, "Warning:"
  end

  test "Low warning will show if remaining_amount_of_pills = 10" do
    click_link 'Add New Dose'

    assert_content page, 'Please enter in your dose information here'

    select '1', from: 'Amount of pills taken'
    select '2', from: 'Pain scale'

    click_button "Add Dose"

    assert_content page, "Warning:"
  end
end
