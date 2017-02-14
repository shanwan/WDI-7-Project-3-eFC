class AddColumnsToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :next_of_kin, :string
    add_column :patients, :next_of_kin_email, :string
    add_column :patients, :next_of_kin_contact, :integer
    add_column :patients, :next_of_kin_POA, :boolean
    add_column :patients, :means_testing, :boolean
    add_column :patients, :medisave_access, :boolean
  end
end
