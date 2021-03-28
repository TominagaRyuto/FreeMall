class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :item_genre_id,     null: false
      t.integer :shop_id,           null: false
      t.string  :name,              null: false, default: ""
      t.string  :image_id,          null: false, default: ""
      t.text    :introduction,      null: false, default: ""
      t.integer :price,             null: false
      t.integer :stock,             null: false
      t.boolean :is_active,         null: false, default: "true"

      t.timestamps
    end
  end
end
