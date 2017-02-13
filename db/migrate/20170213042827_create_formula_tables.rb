class CreateFormulaTables < ActiveRecord::Migration[5.0]
  def change
    create_table :formula_tables do |t|
      t.string :Income_Min
      t.string :Income_Max
      t.string :Class_C_SG
      t.string :Class_B2_SG
      t.string :Class_C_PR
      t.string :Class_B2_PR

      t.timestamps
    end
  end
end
