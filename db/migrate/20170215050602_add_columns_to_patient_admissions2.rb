class AddColumnsToPatientAdmissions2 < ActiveRecord::Migration[5.0]
  def change
    add_column :patient_admissions, :claim_medisave, :integer
    add_column :patient_admissions, :pay_cash, :integer
  end
end
