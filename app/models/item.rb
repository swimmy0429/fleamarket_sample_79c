class Item < ApplicationRecord

  # has_many :comments, dependent: :destroy
  # has_many :favorites
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  # has_one :user_evaluation

  extend ActiveHash::Associations::ActiveRecordExtensions
  # Gem：jp_prefectureを使用して都道府県コードを取得
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition


  # belongs_to user, foreign_key: 'user_id'
  belongs_to :category_id
 
  
  belongs_to_active_hash :shipping_charge_players
  belongs_to_active_hash :preparation_day

  # belongs_to_active_hash :delivery_type
  # belongs_to_active_hash :size
  # belongs_to :brand

  belongs_to :seller, class_name: "user", foreign_key: "seller_id"
  # belongs_to :seller, class_name: "user" = （Itemに紐づく） Userモデルをsellerと定義する。　
  # foreign_key: "seller_id" = user_idはItemレコードの『seller_idカラム』のid番号を使う

  belongs_to :buyer, class_name: "user", foreign_key: "buyer_id"
  # belongs_to :buyer, class_name: "user" = （Itemに紐づく） Userモデルをbuyerと定義する。　
  # foreign_key: "seller_id" = user_idはItemレコードの『buyer_idカラム』のid番号を使う
  
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :shipping_charge_players_id, presence: true
  validates :prefecture_code, presence: true
  validates :item_condition_id, presence: true
  validates :size, presence: true
  validates :preparation_day_id, presence: true


  # validates :delivery_type, presence: true

  validates_length_of :item_images, minimum: 1  

  enum trading_status: { waiting: 0, working: 1, completed: 2 }
end
