require "test_helper"

class DoctorCanViewPatientsFromRootPageTest < Capybara::Rails::TestCase
  setup do
    pat = Patient.create! email: "jd@example.com",
                          first_name: "Jane",
                          last_name: "Doe",
                          password: "12345678",
                          insurer: "Humana"

    meg = Patient.create! email: "mkd1@rice.edu",
                          first_name: "Meghan",
                          last_name: "Davenport",
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

    prescrip3 = Prescription.create! initial_amount_of_pills: 50,
                                     length_of_prescription: 30,
                                     max_dose_amount: 4,
                                     doctor_id: doc.id,
                                     patient_id: meg.id,
                                     drug_name: "Lipitor",
                                     purpose: "To prevent heart attacks and stroke",
                                     instructions: "Take right after eating breakfast and dinner",
                                     doses_per_day: 2
    visit root_path

    click_link "I am a doctor"

    fill_in "Email", with: "doc@doctors.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"
  end

  test "Doctor can view all his/her patients" do
    assert_content page, "Jane"
    assert_content page, "Meghan"
  end

  test "Prescription counter works" do
    assert_content page, "1"
    assert_content page, "2"
  end

  test "Doctor can click on individual patient" do
    click_link "mkd1@rice.edu"
    assert_content page, "Your Prescriptions for Meghan Davenport"
  end

  test "Doctor can see all prescriptions for individual patient" do
    click_link "mkd1@rice.edu"
    assert_content page, "Lipitor"
  end

  test "Doctor can see individual prescriptions for patient" do
    click_link "mkd1@rice.edu"
    click_link "Lipitor"

    assert_content page, "Your Lipitor Prescription for Meghan Davenport"
  end


end
