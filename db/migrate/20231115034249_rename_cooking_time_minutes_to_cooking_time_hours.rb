class RenameCookingTimeMinutesToCookingTimeHours < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipes, :cooking_time_minutes, :cooking_time_hours
    change_column :recipes, :cooking_time_hours, :decimal
  end
end
