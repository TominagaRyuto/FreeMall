class ShopGenre < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :shops, dependent: :destroy
end
