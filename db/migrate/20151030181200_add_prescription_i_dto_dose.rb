class AddPrescriptionIDtoDose < ActiveRecord::Migration
  def change
    add_column :doses, :prescription_id, :integer
  end
end
