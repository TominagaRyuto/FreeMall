class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id,           null: false
      t.string :postal_code,        null: false, default: ""
      t.string :address,            null: false, default: ""
      t.string :name,               null: false, default: ""
      t.timestamps
    end
  end
end
