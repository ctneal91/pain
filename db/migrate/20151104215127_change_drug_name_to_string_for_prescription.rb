class ChangeDrugNameToStringForPrescription < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :drug_name, :integer
    add_column :prescriptions, :drug_name, :string
  end
end
