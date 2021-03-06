class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id,           null: false
      t.string :postal_code,        null: false, default: ""
      t.string :address,            null: false, default: ""
      t.string :name,               null: false, default: ""
      t.string :total_payment,     null: false, default: ""
      t.integer :shipping_cost,     null: false, default: 500
      t.integer :payment_method,    null: false, default: 0
      t.integer :status,            null: false, default: 0

      t.timestamps
    end
  end
end
