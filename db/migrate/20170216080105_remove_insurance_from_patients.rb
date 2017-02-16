class RemoveInsuranceFromPatients < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :insurance
  end
end
