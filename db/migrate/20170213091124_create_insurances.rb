class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :insurances do |t|
      t.string :insurance_co
      t.string :insurance_name
      t.string :insurance_type
      t.integer :claimable_amt
      t.string :personal_id

      t.timestamps
    end
  end
end
