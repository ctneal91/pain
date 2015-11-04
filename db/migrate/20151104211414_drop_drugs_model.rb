class DropDrugsModel < ActiveRecord::Migration
  def up
    drop_table :drugs
  end

  def down
    create_table :doses do |t|
      t.string :brand_name
      t.string :nonpropietary_name
      t.string :chemical_name
      t.string :purpose

      t.timestamps null: false
    end
  end
end
