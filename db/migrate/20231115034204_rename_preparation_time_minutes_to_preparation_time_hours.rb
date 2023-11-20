class RenamePreparationTimeMinutesToPreparationTimeHours < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipes, :preparation_time_minutes, :preparation_time_hours
    change_column :recipes, :preparation_time_hours, :decimal
  end
end
