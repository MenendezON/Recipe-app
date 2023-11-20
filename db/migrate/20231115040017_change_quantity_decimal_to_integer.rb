class ChangeQuantityDecimalToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :inventory_foods, :quantity, :integer
    change_column :recipe_foods, :quantity, :integer
  end
end
