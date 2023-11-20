# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users

user1 = User.create(name: 'John Doe')

user2 = User.create(name: 'Jane Doe')

# Create Inventories

inventory1 = Inventory.create(name: 'Fridge', user: user1)

inventory2 = Inventory.create(name: 'Pantry', user: user1)

Inventory.create(name: 'Fridge', user: user2)

Inventory.create(name: 'Pantry', user: user2)

# Create Foods

food1 = Food.create(name: 'Eggs', measurement_unit: 'dozen', price_dollars: 2)

food2 = Food.create(name: 'Milk', measurement_unit: 'gallon', price_dollars: 3)

food3 = Food.create(name: 'Bread', measurement_unit: 'loaf', price_dollars: 1)

# Create InventoryFoods

InventoryFood.create(inventory: inventory1, food: food1, quantity: 1)

InventoryFood.create(inventory: inventory1, food: food2, quantity: 1)

InventoryFood.create(inventory: inventory1, food: food3, quantity: 1)

InventoryFood.create(inventory: inventory2, food: food1, quantity: 1)

InventoryFood.create(inventory: inventory2, food: food2, quantity: 1)

InventoryFood.create(inventory: inventory2, food: food3, quantity: 1)

# Create Recipes

recipe1 = Recipe.create(name: 'Scrambled Eggs', preparation_time_hours: 5.25, cooking_time_hours: 3.25,
                        description: 'Scrambled eggs are a staple breakfast food.', public: true, user: user1)

recipe2 = Recipe.create(name: 'French Toast', preparation_time_hours: 3.50, cooking_time_hours: 4.50,
                        description: 'French toast is a staple breakfast food.', public: true, user: user1)

Recipe.create(name: 'Grilled Cheese', preparation_time_hours: 2.75, cooking_time_hours: 1.75,
              description: 'Grilled cheese is a staple lunch food.', public: true, user: user1)

Recipe.create(name: 'Scrambled Eggs', preparation_time_hours: 1.75, cooking_time_hours: 2.75,
              description: 'Scrambled eggs are a staple breakfast food.', public: true, user: user2)

Recipe.create(name: 'French Toast', preparation_time_hours: 2.00, cooking_time_hours: 3.00,
              description: 'French toast is a staple breakfast food.', public: true, user: user2)

Recipe.create(name: 'Grilled Cheese', preparation_time_hours: 4.00, cooking_time_hours: 1.75,
              description: 'Grilled cheese is a staple lunch food.', public: true, user: user2)

# Create RecipeFoods

RecipeFood.create(recipe: recipe1, food: food1, quantity: 1)

RecipeFood.create(recipe: recipe1, food: food2, quantity: 1)

RecipeFood.create(recipe: recipe1, food: food3, quantity: 1)

RecipeFood.create(recipe: recipe2, food: food1, quantity: 1)

RecipeFood.create(recipe: recipe2, food: food2, quantity: 1)

RecipeFood.create(recipe: recipe2, food: food3, quantity: 1)
