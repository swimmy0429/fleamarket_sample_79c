class RenameShippingChargePlayersColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_charge_players_id, :shipping_charge_players_id
  end
end
