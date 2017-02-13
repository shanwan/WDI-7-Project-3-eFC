class CreateWards < ActiveRecord::Migration[5.0]
  def change
    create_table :wards do |t|
      t.string :hospital
      t.string :ward_type
      t.boolean :availability

      t.timestamps
    end
  end
end
