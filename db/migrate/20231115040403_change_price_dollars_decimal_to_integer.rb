class ChangePriceDollarsDecimalToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :foods, :price_dollars, :integer
  end
end
