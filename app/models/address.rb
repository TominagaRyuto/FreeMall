class Address < ApplicationRecord
  validates :name, :address, presence: true
  validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }

  belongs_to :user
end
