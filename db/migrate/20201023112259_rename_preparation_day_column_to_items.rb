class RenamePreparationDayColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :preparation_day, :preparation_day_id
  end
end
