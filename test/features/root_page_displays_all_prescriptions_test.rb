require "test_helper"

class RootPageDisplaysAllPrescriptionsTest < Capybara::Rails::TestCase
  test "Prescriptions displayed on index page" do
    visit root_path

    pat = Patient.create! email: "jd@example.com",
                              first_name: "Jane",
                              last_name: "Doe",
                              password: "12345678",
                              insurer: "Humana"

    doc = Doctor.create! email: "doc@doctors.com",
                         first_name: "Jane",
                         last_name: "Doe",
                         password: "12345678",
                         speciality: "Family Medicine"

    prescrip = Prescription.create! initial_amount_of_pills: 60,
                                    length_of_prescription: 30,
                                    doctor_id: doc.id,
                                    patient_id: pat.id

    prescrip2 = Prescription.create! initial_amount_of_pills: 50,
                                     length_of_prescription: 30,
                                     doctor_id: doc.id,
                                     patient_id: pat.id


    #Doctor Can view prescription
    click_link "I am a doctor"

    fill_in "Email", with: "doc@doctors.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "60"
    assert_content page, "50"

    click_link "Sign Out"

    #Patient can view prescription
    click_link "I am a patient"

    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "60"
    assert_content page, "50"
  end
end
