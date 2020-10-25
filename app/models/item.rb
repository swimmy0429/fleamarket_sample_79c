class Item < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # has_many :favorites
  has_many :item_images, dependent: :destroy
  # has_one :user_evaluation
  # belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :item_condition
  # belongs_to_active_hash :shipping_charge_players
  # belongs_to_active_hash :preparation_day
  # belongs_to_active_hash :delivery_type
  # belongs_to :brand
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  # Gem：jp_prefectureを使用して都道府県コードを取得


  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :shipping_charge_players, presence: true
  validates :prefecture_code, presence: true
  # validates :size, presence: true
  validates :preparation_day, presence: true
  validates :delivery_type, presence: true
  validates :category, presence: true


  enum trading_status: { waiting: 0, working: 1, completed: 2 }
end
