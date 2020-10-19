class AddSellerToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :seller, null: false
  end
end
