class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id,           null: false, default: ""
      t.integer :order_id,          null: false, default: ""
      t.integer :price,              null: false, default: ""
      t.integer :amount,            null: false, default: ""
      t.timestamps
    end
  end
end
