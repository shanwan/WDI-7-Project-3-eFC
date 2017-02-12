class RemoveFieldNameFromPatients < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :appointment_financial_counsel
  end
end
