class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id,           null: false, default: ""
      t.integer :shop_genre_id,     null: false, default: ""
      t.string :name,               null: false, default: ""
      t.text :introduction,         null: false, default: ""
      t.integer :prefectures
      t.string :postal_code
      t.string :address
      t.text :official_hp
      t.string :image_id
      t.timestamps
    end
  end
end