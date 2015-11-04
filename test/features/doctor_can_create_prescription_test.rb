require "test_helper"

class DoctorCanCreatePrescriptionTest < Capybara::Rails::TestCase
  setup do

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

    click_link "mkd1@rice.edu"

    click_link "Add New Prescription"
  end

  test "Doctor can access new prescription" do
    assert_content page, "Add New Prescription for Meghan Davenport"
  end

  test "Doctor can add new prescription" do
    fill_in "Drug Name", with: "Vicodin"
    fill_in "Purpose", with: "To relieve pain"
    fill_in "Instructions", with: "Take 2 pills as necessary for pain"
    fill_in "Doses Per Day", with: 4
    fill_in "Max Dose Amount", with: 3
    fill_in "Amount of Pills", with: 150
    fill_in "Length of Prescription (Days)", with: 30
    click_button "Create New Prescription"

    assert_content page, "Meghan Davenport"
    assert_content page, "Vicodin"
    assert_content page, "Lipitor"
  end
end
