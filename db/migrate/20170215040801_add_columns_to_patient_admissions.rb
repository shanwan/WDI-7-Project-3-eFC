class AddColumnsToPatientAdmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :PatientAdmissions, :claim_medisave, :integer
    add_column :PatientAdmissions, :pay_cash, :integer
  end
end
