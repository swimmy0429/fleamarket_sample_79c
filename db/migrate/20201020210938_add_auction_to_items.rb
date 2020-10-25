class AddAuctionToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :auction, :integer
  end
end
