class DropDrugIdAndAddDrugNamesToPrescriptions < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :drug_id, :integer
    add_column :prescriptions, :drug_name, :integer
    add_column :prescriptions, :purpose, :string
    add_column :prescriptions, :instructions, :string
    add_column :prescriptions, :doses_per_day, :integer
  end
end
