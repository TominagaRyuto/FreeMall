class Item < ApplicationRecord
  attachment :image
  validates :name, :introduction, :image, :price, presence: true
  belongs_to :shop
  belongs_to :item_genre
end
