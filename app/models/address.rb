class Address < ApplicationRecord
  validates :name, :address, presence: true
  validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }

  belongs_to :user
  def full_address
    "〒" + self.postal_code.to_s.insert(3, "-") + self.address + "　" + self.name
  end
end
