class Order < ApplicationRecord
  validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }
  validates :name, :address, presence: true
  belongs_to :user
  belongs_to :shop
end
