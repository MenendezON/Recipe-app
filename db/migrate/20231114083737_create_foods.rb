class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit, null: false
      t.decimal :price_dollars, null: false, default: 0.0

      t.timestamps
    end
  end
end
