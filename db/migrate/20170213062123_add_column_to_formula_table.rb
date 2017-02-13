class AddColumnToFormulaTable < ActiveRecord::Migration[5.0]
  def change
    add_column :formula_tables, :Class_A, :integer
  end
end
