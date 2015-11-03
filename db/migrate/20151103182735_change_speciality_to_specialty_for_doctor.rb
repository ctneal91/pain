class ChangeSpecialityToSpecialtyForDoctor < ActiveRecord::Migration
  def change
    remove_column :doctors, :speciality, :string
    add_column :doctors, :specialty, :string
  end
end
