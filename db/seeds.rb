# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

j = Patient.create! first_name: "Bill",
                    last_name: "Murray",
                    email: "king@celebrity.com",
                    password: "12345678",
                    insurer: "Insurance"

me = Patient.create! first_name: "Christian",
                     last_name: "Neal",
                     email: "c.neal91@gmail.com",
                     password: "12345678",
                     insurer: "Insurance"

d = Doctor.create! first_name: "Jane",
                   last_name: "Doe",
                   specialty: "Internal Medicine",
                   email: "jane@doe.com",
                   password: "12345678"

prescrip1 = Prescription.create! initial_amount_of_pills: 60,
                                 length_of_prescription: 30,
                                 max_dose_amount: 4,
                                 patient_id: j.id,
                                 doctor_id: d.id,
                                 drug_name: "Vicodin",
                                 purpose: "To relieve pain",
                                 doses_per_day: 4,
                                 instructions: "Take as needed for excruciating pain."

prescrip2 = Prescription.create! initial_amount_of_pills: 70,
                                 length_of_prescription: 30,
                                 max_dose_amount: 4,
                                 patient_id: me.id,
                                 doctor_id: d.id,
                                 drug_name: "Hydrocodone",
                                 purpose: "To relieve pain",
                                 doses_per_day: 2,
                                 instructions: "Take as needed for excruciating pain."

dose1 = Dose.create! amount_of_pills_taken: 3,
                     pain_scale: 8,
                     qualitative_description_of_current_pain: "Could no longer focus",
                     prescription_id: prescrip1.id

dose2 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 5,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose3 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 5,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip2.id

dose4 = Dose.create! amount_of_pills_taken: 1,
                     pain_scale: 3,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose5 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 6,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose6 = Dose.create! amount_of_pills_taken: 3,
                     pain_scale: 7,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id


dose3.update_attribute :created_at, (rand*4).days.ago
dose2.update_attribute :created_at, (rand*4).days.ago
dose1.update_attribute :created_at, (rand*4).days.ago
dose4.update_attribute :created_at, (rand*4).days.ago
dose5.update_attribute :created_at, (rand*4).days.ago
dose6.update_attribute :created_at, (rand*4).days.ago
