class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true

  def self.total_price(recipe)
    recipe_foods = RecipeFood.where(recipe_id: recipe)
    price = 0
    recipe_foods.each do |recipe_food|
      Food.find(recipe_food.food_id)
      price += recipe_food.quantity * recipe_food.food.price_dollars
    end
    price
  end
end
