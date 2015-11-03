class AddMaxDoseAmountToPrescription < ActiveRecord::Migration
  def change
    add_column :prescriptions, :max_dose_amount, :integer
  end
end
