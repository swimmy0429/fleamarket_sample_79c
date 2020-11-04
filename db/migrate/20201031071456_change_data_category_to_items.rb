class ChangeDataCategoryToItems < ActiveRecord::Migration[6.0]
  def change
    def change
      change_column :items, :category, :references
    end
  end
end
