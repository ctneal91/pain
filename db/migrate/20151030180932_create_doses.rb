class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.integer :amount_of_pills_taken
      t.integer :pain_scale
      t.string :qualitative_description_of_current_pain
      t.time :time_taken

      t.timestamps null: false
    end
  end
end
