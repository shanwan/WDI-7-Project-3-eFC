class CreateInsuranceTables < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_tables do |t|
      t.string :insurance_company
      t.string :insurance_name
      t.string :insurance_type
      t.integer :claimable_amount

      t.timestamps
    end
  end
end
