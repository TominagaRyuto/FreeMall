class Shop < ApplicationRecord
  validates :shop_genre_id, :user_id, :name, :introduction, presence: true
  validates :user_id,uniqueness: true
  validates :postal_code, length: { is: 7 }, allow_blank: true, numericality: { only_integer: true }

  belongs_to :shop_genre
  belongs_to :user
end
