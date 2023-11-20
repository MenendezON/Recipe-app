require 'rails_helper'

# RSpec.describe 'Foods', type: :system do
#   include Devise::Test::IntegrationHelpers
#   before(:all) do
#     delete_all

#     @user = User.first
#     @user ||= User.create!(
#       name: 'pepe',
#       email: 'john.doe@mail.com',
#       password: 'admin1234'
#     )

#     @food1 = Food.create(name: 'Pizza',
#                          measurement_unit: 'Slice',
#                          price_dollars: 8.99)
#     @food2 = Food.create(
#       name: 'Burger',
#       measurement_unit: 'Piece',
#       price_dollars: 5.99
#     )
#     @foods = Food.all
#   end

#   before(:each) do
#     sign_in @user
#   end

#   it 'allows adding a new food 3' do
#     visit foods_path
#     click_button 'Add food'

#     fill_in 'Name', with: 'Sushi'
#     select 'kg', from: 'Measurement unit'
#     fill_in 'Price', with: '12.99'

#     click_on 'Create food'

#     expect(page).to have_content('food was successfully added.')
#   end

#   it 'allows removing a food' do
#     visit foods_path

#     first(:link, 'Delete').click

#     page.driver.browser.switch_to.alert.accept

#     expect(page).to have_selector('.alert', text: 'food was successfully deleted.')
#   end

#   def delete_all
#     RecipeFood.delete_all
#     Food.delete_all
#     Recipe.delete_all
#     User.delete_all
#   end
# end
