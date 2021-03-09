class Item < ApplicationRecord
  validates :name, :introduction, :image, :price, presence: true
  belongs_to :item_genre, :shop
end
