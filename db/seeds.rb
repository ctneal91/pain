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

c = Patient.create! first_name: "Cassie",
                    last_name: "DeWitt",
                    email: "cdewitt@example.com",
                    password: "12345678",
                    insurer: "Humana"

e = Patient.create! first_name: "Eddie",
                    last_name: "Barnes",
                    email: "eddie@aol.com",
                    password: "12345678",
                    insurer: "BCBS"

l = Patient.create! first_name: "Pamela",
                    last_name: "Ison",
                    email: "pamela@ison.com",
                    password: "12345678",
                    insurer: "Aegion"

mom = Patient.create! first_name: "Kathy",
                      last_name: "Holton",
                      email: "none@email.com",
                      password: "12345678",
                      insurer: "BCBS"

gramps = Patient.create! first_name: "Bobby",
                         last_name: "Ted",
                         email: "none@aol.com",
                         password: "12345678",
                         insurer: "BCBS"

ladd = Patient.create! first_name: "David",
                       last_name: "Peny",
                       email: "ladd@gmail.com",
                       password: "12345678",
                       insurer: "BCBS"

mike = Patient.create! first_name: "Mike",
                       last_name: "Penny",
                       email: "mike@cafe.com",
                       password: "12345678",
                       insurer: "Obamacare"

elisha = Patient.create! first_name: "Elisha",
                         last_name: "Penny",
                         email: "eli@home.com",
                         password: "12345678",
                         insurer: "TCH"

mercedes = Patient.create! first_name: "Mercedes",
                           last_name: "Gray",
                           email: "nicole@gray.com",
                           password: "12345678",
                           insurer: "TCH"

travis = Patient.create! first_name: "Travis",
                         last_name: "Ci",
                         email: "travis@ci.com",
                         password: "12345678",
                         insurer: "Help"

d = Doctor.create! first_name: "Jane",
                   last_name: "Doe",
                   specialty: "Internal Medicine",
                   email: "jane@doe.com",
                   password: "12345678"

prescrip1 = Prescription.create! initial_amount_of_pills: 70,
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

prescrip3 = Prescription.create! initial_amount_of_pills: 70,
                             length_of_prescription: 30,
                             max_dose_amount: 4,
                             patient_id: elisha.id,
                             doctor_id: d.id,
                             drug_name: "Hydrocodone",
                             purpose: "To relieve pain",
                             doses_per_day: 2,
                             instructions: "Take as needed for excruciating pain."

prescrip4 = Prescription.create! initial_amount_of_pills: 70,
                             length_of_prescription: 30,
                             max_dose_amount: 4,
                             patient_id: mercedes.id,
                             doctor_id: d.id,
                             drug_name: "Oxycotin",
                             purpose: "To relieve pain",
                             doses_per_day: 2,
                             instructions: "Take as needed for excruciating pain."

prescrip5 = Prescription.create! initial_amount_of_pills: 40,
                             length_of_prescription: 30,
                             max_dose_amount: 4,
                             patient_id: travis.id,
                             doctor_id: d.id,
                             drug_name: "Tramadol",
                             purpose: "To relieve pain",
                             doses_per_day: 2,
                             instructions: "Take as needed for excruciating pain."

prescrip6 = Prescription.create!  initial_amount_of_pills: 20,
                              length_of_prescription: 10,
                              max_dose_amount: 3,
                              patient_id: ladd.id,
                              doctor_id: d.id,
                              drug_name: "Xyzal",
                              purpose: "To relieve pain",
                              doses_per_day: 2,
                              instructions: "Take as needed for excruciating pain."

prescrip7 = Prescription.create!  initial_amount_of_pills: 1,
                              length_of_prescription: 1,
                              max_dose_amount: 1,
                              patient_id: ladd.id,
                              doctor_id: d.id,
                              drug_name: "Xyzal",
                              purpose: "To relieve pain",
                              doses_per_day: 2,
                              instructions: "Take as needed for excruciating pain."

dose1 = Dose.create! amount_of_pills_taken: 3,
                     pain_scale: 8,
                     qualitative_description_of_current_pain: "Could no longer focus",
                     prescription_id: prescrip1.id

dose2 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 7,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose3 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 8,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose4 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 9,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose5 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 7,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose6 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 7,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose7 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 8,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose8 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 6,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose9 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 8,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose9 = Dose.create! amount_of_pills_taken: 2,
                     pain_scale: 7,
                     qualitative_description_of_current_pain: "Couldn't sleep",
                     prescription_id: prescrip1.id

dose10 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 6,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose11 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose12 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 6,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose13 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 7,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose14 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose15 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 8,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose16 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose16 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 4,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose17 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 6,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose18 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 4,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose19 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 6,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose20 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 7,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose21 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose22 = Dose.create! amount_of_pills_taken: 1,
                      pain_scale: 3,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose23 = Dose.create! amount_of_pills_taken: 1,
                      pain_scale: 4,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose24 = Dose.create! amount_of_pills_taken: 1,
                      pain_scale: 3,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose25 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose26 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 7,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose27 = Dose.create! amount_of_pills_taken: 1,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose28 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 8,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose29 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 7,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose30 = Dose.create! amount_of_pills_taken: 2,
                      pain_scale: 5,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose31 = Dose.create! amount_of_pills_taken: 1,
                      pain_scale: 2,
                      qualitative_description_of_current_pain: "Couldn't sleep",
                      prescription_id: prescrip1.id

dose3.update_attribute :created_at, 10.days.ago
dose2.update_attribute :created_at, 10.days.ago
dose1.update_attribute :created_at, 10.days.ago
dose4.update_attribute :created_at, 10.days.ago
dose5.update_attribute :created_at, 9.days.ago
dose6.update_attribute :created_at, 9.days.ago
dose7.update_attribute :created_at, 9.days.ago
dose8.update_attribute :created_at, 9.days.ago
dose9.update_attribute :created_at, 8.days.ago
dose10.update_attribute :created_at, 8.days.ago
dose11.update_attribute :created_at, 8.days.ago
dose12.update_attribute :created_at, 7.days.ago
dose13.update_attribute :created_at, 7.days.ago
dose14.update_attribute :created_at, 7.days.ago
dose15.update_attribute :created_at, 6.days.ago
dose16.update_attribute :created_at, 6.days.ago
dose17.update_attribute :created_at, 6.days.ago
dose18.update_attribute :created_at, 5.days.ago
dose19.update_attribute :created_at, 5.days.ago
dose20.update_attribute :created_at, 4.days.ago
dose21.update_attribute :created_at, 4.days.ago
dose22.update_attribute :created_at, 4.days.ago
dose23.update_attribute :created_at, 3.days.ago
dose24.update_attribute :created_at, 3.days.ago
dose25.update_attribute :created_at, 3.days.ago
dose26.update_attribute :created_at, 2.days.ago
dose27.update_attribute :created_at, 2.days.ago
dose28.update_attribute :created_at, 2.days.ago
dose29.update_attribute :created_at, 2.days.ago
dose30.update_attribute :created_at, 1.days.ago
dose31.update_attribute :created_at, 1.days.ago
