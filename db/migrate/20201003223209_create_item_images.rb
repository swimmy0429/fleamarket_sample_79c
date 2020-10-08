class CreateItemImages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_images do |t|
      t.string :url
      t.string :src
      t.references :item,null: false, foreign_key: true
    end
  end
end
