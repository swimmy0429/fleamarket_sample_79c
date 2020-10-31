class AddDeliveryTypeIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delivery_type, :integer
  end
end
