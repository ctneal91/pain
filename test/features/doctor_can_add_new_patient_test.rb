require "test_helper"

class DoctorCanAddNewPatientTest < Capybara::Rails::TestCase
  setup do
    meg = Patient.create! email: "mkd1@rice.edu",
                          first_name: "Meghan",
                          last_name: "Davenport",
                          password: "12345678",
                          insurer: "Humana"

    neal = Patient.create! email: "c.neal91@gmail.com",
                           first_name: "Christian",
                           last_name: "Neal",
                           password: "12345678",
                           insurer: "Obamacare"

    jwo = Patient.create! email: "jwo@tiy.com",
                           first_name: "Jesse",
                           last_name: "Wolgamott",
                           password: "12345678",
                           insurer: "TIY Plan"

    doc = Doctor.create! email: "doc@doctors.com",
                         first_name: "Jane",
                         last_name: "Doe",
                         password: "12345678",
                         specialty: "Family Medicine"

    prescrip = Prescription.create! initial_amount_of_pills: 50,
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
  test "Doctor can see all patients on all patients page" do
    click_link "Add New Patient"
    assert_content page, "Christian Neal"
    assert_content page, "Meghan Davenport"
  end
  # 
  # test "Doctor can click link to see new patient" do
  #   click_link "Add New Patient"
  #
  #   click_link "c.neal91@gmail.com"
  #
  #   click_link "Add New Prescription for Christian Neal"
  # end
end
