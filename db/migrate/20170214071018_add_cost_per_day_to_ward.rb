class AddCostPerDayToWard < ActiveRecord::Migration[5.0]
  def change
    add_column :wards, :cost_per_day, :integer 
  end
end
