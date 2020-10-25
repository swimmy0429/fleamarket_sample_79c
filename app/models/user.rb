class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname,:email, :password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_year_month_day ,presence: true

  has_many :items
  
  # 販売中
  has_many :selling_items, -> { where("seller_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  # Itemモデル名を selling_itemsに定義する = has_many :selling_items, class_name: "item"
  # itemレコードの”seller_id”カラムに自分のidが入っている、itemだけ取得する = foreign_key: "seller_id" （ userはhas_many: itemsだから ）
  # でも、buyer_idが入っていないitemだけにする = -> { where("buyer_id is NULL") }

  # 売却済み商品
  has_many :sold_items, -> { where("seller_id is not NULL && buyer_id is not NULL") }, class_name: "Item"
  # Itemモデル名を sold_itemsに定義する = has_many :selling_items, class_name: "item"
  # Itemレコードの”seller_id”カラムに自分のidが入っている、itemだけ取得するね = foreign_key: "seller_id" （ userはhas_many: itemsだから ）
  # buyer_idが入ってるitemだけにする = -> { where("buyer_id is not NULL") }

  # 買った商品
  # has_many :bought_items, class_name: "item", foreign_key: "buyer_id"
  # Itemモデル名を bought_itemsに定義する = has_many :bought_itemss, class_name: "item"
  # itemレコードの”buyer_id”カラムに自分のidが入っている、itemだけ取得する = foreign_key: "buyer_id" （ userはhas_many: itemsだから ）

end

  