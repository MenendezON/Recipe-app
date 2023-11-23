require 'rails_helper'
RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  it 'is valid with a name, preparation_time, cooking_time, and a user' do
    recipe = Recipe.new(name: 'Delicious Dish', preparation_time_hours: 30, public: true, cooking_time_hours: 60, user:)
    expect(recipe).to be_valid
  end
  it 'is not valid without a name' do
    recipe = Recipe.new(name: nil, preparation_time_hours: 30, cooking_time_hours: 60, user:)
    expect(recipe).to_not be_valid
  end
  it 'is not valid without preparation_time' do
    recipe = Recipe.new(name: 'Delicious Dish', preparation_time_hours: nil, cooking_time_hours: 60, user:)
    expect(recipe).to_not be_valid
  end
  it 'is not valid without cooking_time' do
    recipe = Recipe.new(name: 'Delicious Dish', preparation_time_hours: 30, cooking_time_hours: nil, user:)
    expect(recipe).to_not be_valid
  end
  it 'is not valid without a user' do
    recipe = Recipe.new(name: 'Delicious Dish', preparation_time_hours: 30, cooking_time_hours: 60, user: nil)
    expect(recipe).to_not be_valid
  end
  it 'can have associated recipe foods' do
    recipe = Recipe.new(name: 'Delicious Dish', preparation_time_hours: 30, cooking_time_hours: 60, user:)
    recipe.recipe_foods.build(quantity: 2, food_id: 1)
    expect(recipe.recipe_foods).to_not be_empty
  end
end
