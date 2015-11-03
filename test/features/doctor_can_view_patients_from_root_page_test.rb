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

    zyrtec = Drug.create! brand_name: "Zyrtec",
                          nonpropietary_name: "Cetirizine",
                          chemical_name: "(±)-[2-[4-[(4-chlorophenyl)phenylmethyl]-1- piperazinyl]ethoxy]acetic acid",
                          purpose: "To prevent hay fever."

    lipitor = Drug.create! brand_name: "Lipitor",
                           nonpropietary_name: "Atorvastatin",
                           chemical_name: "(3R,5R)-7-[2-(4-Fluorophenyl)-3-phenyl-4-(phenylcarbamoyl)-5-propan-2-ylpyrrol-1-yl]-3,5-dihydroxyheptanoic acid",
                           purpose: "To prevent heart attacks"

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

    prescrip3 = Prescription.create! initial_amount_of_pills: 50,
                                     length_of_prescription: 30,
                                     max_dose_amount: 4,
                                     doctor_id: doc.id,
                                     patient_id: meg.id,
                                     drug_id: lipitor.id
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
    assert_content page, "Atorvastatin"
  end


end
