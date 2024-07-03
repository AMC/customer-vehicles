class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :category, null: false
      t.string :name, null: false
      t.integer :length, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
      t.index [:name]
      t.index [:customer_id, :name], unique: true
    end
  end
end
