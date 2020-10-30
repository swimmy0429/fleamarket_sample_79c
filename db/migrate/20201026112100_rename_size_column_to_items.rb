class RenameSizeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :size, :size_id
  end
end
