class RemoveFieldNameFromWard < ActiveRecord::Migration[5.0]
  def change
    remove_column :wards, :availability
  end

  def change
    add_column :wards, :availability,  :integer
  end
end
