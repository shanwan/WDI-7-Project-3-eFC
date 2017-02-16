class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :patient_admissions, :NRIC, :personal_id
  end
end
