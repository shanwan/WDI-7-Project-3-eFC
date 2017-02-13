class AddAvailabilityToWard < ActiveRecord::Migration[5.0]
  def change
    add_column :wards, :availability, :integer
  end
end
