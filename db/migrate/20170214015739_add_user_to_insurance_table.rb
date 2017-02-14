class AddUserToInsuranceTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :insurance_tables, :user, foreign_key: true
  end
end
