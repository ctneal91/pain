class DropDrugIdFromPrescription < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :drug_id, :integer
  end
end
