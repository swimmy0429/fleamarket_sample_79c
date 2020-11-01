class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false
      t.text :introduction,null: false
      t.integer :price,null: false
      # t.references :brand,foreign_key: true
      t.integer :item_condition,null: false
      t.integer :shipping_charge_players
      t.integer :prefecture_code,null: false
      t.integer :size,null: false
      t.integer :preparation_day,null: false
      t.integer :delivery_type,null: false
      # t.references :category,null: false,foreign_key: true
      # t.integer :trading_status, null: false, default: 0
      t.bigint :seller_id
      # t.references :buyer, foreign_key: {to_table: :users}
      # t.references :auction, foreign_key: {to_table: :users}
      # t.datetime :deal_closed_date, foreign_key:
      t.string :brand #出品情報送信のため、暫定的に追加
      # t.string :category_id
      t.integer :buyer_id
      t.datetime :deal_closed_date
      t.integer :category_id #出品情報送信のため、暫定的に追加
    end
  end
end
