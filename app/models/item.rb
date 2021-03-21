class Item < ApplicationRecord
  attachment :image
  validates :name, :introduction, :image, :price, :stock, presence: true
  belongs_to :shop
  belongs_to :item_genre
  has_many :likes, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
