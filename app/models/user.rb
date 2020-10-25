class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:email, :password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_year_month_day ,presence: true

  #１人１枚クレジットカードを登録出来るように設定
  has_one :card, dependent: :destroy
end
