require "test_helper"

class CanAddDoseTest < Capybara::Rails::TestCase
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
                         speciality: "Family Medicine"

    zyrtec = Drug.create! brand_name: "Zyrtec",
                          nonpropietary_name: "Cetirizine",
                          chemical_name: "(±)-[2-[4-[(4-chlorophenyl)phenylmethyl]-1- piperazinyl]ethoxy]acetic acid",
                          purpose: "To prevent hay fever."

    lipitor = Drug.create! brand_name: "Lipitor"

    prescrip = Prescription.create! initial_amount_of_pills: 60,
                                    length_of_prescription: 30,
                                    max_dose_amount: 5,
                                    doctor_id: doc.id,
                                    patient_id: pat.id,
                                    drug_id: zyrtec.id

    prescrip2 = Prescription.create! initial_amount_of_pills: 50,
                                     length_of_prescription: 30,
                                     max_dose_amount: 4,
                                     doctor_id: doc.id,
                                     patient_id: pat.id,
                                     drug_id: lipitor.id

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
  end
end
