class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
      t.index [:first_name, :last_name], unique: true
      t.index [:email], unique: true
    end
  end
end
