class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  attachment :image
  validates :name, :name_kana, :nickname, :address, presence: true
  validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postal_code, length: { is: 7 }
  validates :telephone_number, length: { is: 11 }
  validates :postal_code, :telephone_number, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  with_options on: :create do |create|
    create.validates :password, presence: true, on: :create
    create.validates :password, confirmation: true, on: :create
    create.validates :password_confirmation, presence: true, on: :create
  end
end
