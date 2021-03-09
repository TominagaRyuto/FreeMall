class ItemGenre < ApplicationRecord
  belongs_to :shop_genre
  has_many :items, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
