class ShopGenre < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :shops, :item_genres, dependent: :destroy
end
