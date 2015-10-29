class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :brand_name
      t.string :nonpropietary_name
      t.string :chemical_name
      t.string :purpose

      t.timestamps null: false
    end
  end
end
