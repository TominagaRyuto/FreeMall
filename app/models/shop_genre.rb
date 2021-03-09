class ShopGenre < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :shops, dependent: :destroy
    has_many :item_genres, dependent: :destroy
end
