class RenameBrandColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :brand, :brand_id
  end
end
