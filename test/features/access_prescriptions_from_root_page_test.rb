require "test_helper"

class AccessPrescriptionsTest < Capybara::Rails::TestCase

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
                                     max_dose_amount: 5,
                                     doctor_id: doc.id,
                                     patient_id: pat.id,
                                     drug_name: "Lipitor",
                                     purpose: "To prevent heart attacks and stroke",
                                     instructions: "Take right after eating breakfast and dinner",
                                     doses_per_day: 2

    visit root_path
  end

  test "Patient can view prescriptions" do
    click_link "I am a patient"

    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "60"
    assert_content page, "50"
  end

  test "Can access individual prescription from the root page" do
    click_link "I am a patient"

    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link "Zyrtec"

    assert_content page, "Your Zyrtec Prescription"
  end

end
