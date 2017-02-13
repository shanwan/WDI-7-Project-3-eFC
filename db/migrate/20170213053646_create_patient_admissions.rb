class CreatePatientAdmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_admissions do |t|
      t.string :treatment
      t.string :NRIC
      t.integer :length_of_stay
      t.text :treatment
      t.string :ward_selected
      t.integer :bill_amount
      t.date :start_treatment
      t.date :end_treatment
      t.string :doctor_in_charge
      t.boolean :financial_counsel, :default => false
      t.boolean :confirm

      t.timestamps
    end
  end
end
