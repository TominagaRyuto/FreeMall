class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id,           null: false
      t.integer :shop_genre_id,     null: false
      t.string :name,               null: false, default: ""
      t.text :introduction,         null: false, default: ""
      t.integer :prefectures
      t.string :address
      t.text :official_hp
      t.string :image_id
      t.timestamps
    end
  end
end
