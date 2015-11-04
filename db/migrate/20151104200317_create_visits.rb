class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.time :time
      t.date :date
      t.string :reason
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
