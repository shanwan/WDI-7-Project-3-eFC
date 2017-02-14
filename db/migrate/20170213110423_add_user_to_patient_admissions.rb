class AddUserToPatientAdmissions < ActiveRecord::Migration[5.0]
  def change
    add_reference :patient_admissions, :user, foreign_key: true
  end
end
