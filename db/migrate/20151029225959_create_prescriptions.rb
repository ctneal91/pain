class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :initial_amount_of_pills
      t.integer :remaining_amount_of_pills
      t.integer :length_of_prescription
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :drug_id

      t.timestamps null: false
    end
  end
end
