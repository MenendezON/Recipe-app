class CreateInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_foods do |t|
      t.decimal :quantity, null: false, default: 0.0
      t.references :inventory, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
