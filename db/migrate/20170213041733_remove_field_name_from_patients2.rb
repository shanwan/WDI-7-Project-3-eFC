class RemoveFieldNameFromPatients2 < ActiveRecord::Migration[5.0]
    def change
      remove_column :patients, :treatment
      remove_column :patients, :length_of_stay
      remove_column :patients, :ward_selected
      remove_column :patients, :bill_amount
      remove_column :patients, :start_treatment
      remove_column :patients, :end_treatment
      remove_column :patients, :doctor_in_charge
      remove_column :patients, :financial_counsel
    end
end
