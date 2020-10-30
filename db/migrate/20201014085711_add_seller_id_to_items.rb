class AddSellerIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "items", "users", column: :"seller_id"
  end
end
