class RemoveHospitalFromWards < ActiveRecord::Migration[5.0]
  def change
    remove_column :wards, :hospital
    remove_column :patients, :residential_type
  end
end
