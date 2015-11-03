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

droga = Drug.create! brand_name: "Vicodin",
                     nonpropietary_name: "Hydrocodone/paracetamol",
                     chemical_name: "4,5α-epoxy-3-methoxy-17-methylmorphinan-6-one",
                     purpose: "To relieve pain"

prescription = Prescription.create! initial_amount_of_pills: 60,
                                    remaining_amount_of_pills: 50,
                                    length_of_prescription: 30,
                                    max_dose_amount: 4,
                                    patient_id: j.id,
                                    doctor_id: d.id,
                                    drug_id: droga.id
