class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable#, :validatable
  attachment :image
  validates :name, :name_kana, :nickname, :postal_code, :address, :telephone_number, :encrypted_password, :email, presence: true
end
