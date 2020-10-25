class RemoveItemConditionFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :item_condition, :integer
  end
end
