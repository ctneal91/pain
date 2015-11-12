require "test_helper"

class CanAccessRootPageFromNavBarTest < Capybara::Rails::TestCase
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

    visit root_path

  end

  test "Patient can access root path from any page" do
    click_link "I am a patient"

    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link 'Zyrtec'

    click_link 'Jane'
    assert_content page, "Your Current Prescriptions"
  end

  test "Doctor can access root path from any page" do
    click_link "I am a doctor"

    fill_in "Email", with: "doc@doctors.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link "jd@example.com"

    click_link "Dr. Doe"

    assert_content page, "Your Patients"
  end
end
