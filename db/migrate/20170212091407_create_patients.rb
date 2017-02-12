class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :personal_id
      t.text :treatment
      t.integer :length_of_stay
      t.string :ward_selected
      t.integer :bill_amount
      t.string :residential_type
      t.integer :income
      t.boolean :insurance
      t.date :start_treatment
      t.date :end_treatment
      t.string :doctor_in_charge
      t.boolean :financial_counsel
      t.date :appointment_financial_counsel
      t.integer :medisave

      t.timestamps
    end
  end
end
