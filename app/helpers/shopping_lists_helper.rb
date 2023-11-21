module ShoppingListsHelper
  def shopping_list
    @shoppinglist = []
    @recipe_foods = RecipeFood.where(recipe_id: params[:recipe_id])
    @inventory_foods = InventoryFood.where(inventory_id: params[:inventory][:inventory_id])

    @recipe_foods_ids_not_in_inventory = @recipe_foods.pluck(:food_id) - @inventory_foods.pluck(:food_id)

    @recipe_foods_ids_not_in_inventory.each do |food_id|
      target_food = food(food_id)
      @shoppinglist.push({ food_id:,
                           food_name: target_food.name,
                           food_uom: target_food.measurement_unit,
                           quantity: RecipeFood.find_by(recipe_id: params[:recipe_id], food_id:).quantity,
                           price: target_food.price_dollars * RecipeFood.find_by(recipe_id: params[:recipe_id],
                                                                                 food_id:).quantity })
    end

    # Recipe foods that are in inventory but not enough
    @recipe_foods_ids_in_inventory = @recipe_foods.pluck(:food_id) - @recipe_foods_ids_not_in_inventory

    @recipe_foods_ids_in_inventory.each do |food_id|
      target_food = food(food_id)
      @shoppinglist.push({ food_id:,
                           food_name: target_food.name,
                           food_uom: target_food.measurement_unit,
                           quantity: RecipeFood.find_by(recipe_id: params[:recipe_id],
                                                        food_id:).quantity - InventoryFood.find_by(inventory_id: params[:inventory][:inventory_id],
                                                                                                   food_id:).quantity,
                           price: target_food.price_dollars * (RecipeFood.find_by(recipe_id: params[:recipe_id],
                                                                                  food_id:).quantity - InventoryFood.find_by(inventory_id: params[:inventory][:inventory_id],
                                                                                                                             food_id:).quantity) })
    end

    # Filter out foods with 0 or less than 0 quantity
    @shoppinglist = @shoppinglist.select { |item| (item[:quantity]).positive? }

    @shoppinglist
  end

  def total_value_of_food_needed(shopping_list)
    total_value = 0
    shopping_list.each do |item|
      total_value += item[:price]
    end

    total_value
  end

  private

  def food(id)
    Food.find(id)
  end
end