class RemovePreparationDayFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :preparation_day, :integer
  end
end
