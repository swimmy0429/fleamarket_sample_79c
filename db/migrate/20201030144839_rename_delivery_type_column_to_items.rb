class RenameDeliveryTypeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_type, :delivery_type_id
  end
end
