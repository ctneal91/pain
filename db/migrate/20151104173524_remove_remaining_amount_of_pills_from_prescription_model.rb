class RemoveRemainingAmountOfPillsFromPrescriptionModel < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :remaining_amount_of_pills, :integer
  end
end
