require 'rails_helper'

RSpec.feature 'RecipeFoods', type: :feature do
  let(:user) { User.create(name: 'Binod', email: 'binod@example.com', password: 'password') }

  before :each do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user[name]', with: 'Marthekod'
      fill_in 'user[email]', with: 'marthekod@gmail.com'
      fill_in 'user[password]', with: 'ilovemywife'
      fill_in 'user[password_confirmation]', with: 'ilovemywife'
    end
    click_button 'Sign up'
    sleep 1
    visit foods_path
    click_link('Add Food')
    fill_in 'food[name]', with: 'Orange'
    select 'kg', from: 'food[measurement_unit]'
    fill_in 'food[price_dollars]', with: 5.50
    find('input[name="commit"]').click
    visit recipes_path
    click_link 'New Recipe'
    expect(page).to have_content('Add new recipe:')
    fill_in 'Name', with: 'Apple dish'
    fill_in 'Preparation time', with: '1'
    fill_in 'Cooking time', with: '0.5'
    fill_in 'Description', with: 'This is my first apple dish created here'
    click_button 'Create'
    sleep 1
  end

  scenario 'Create/Edit an Recipe Food/Ingredient' do
    click_link 'Add ingredient'
    expect(page).to have_content('Add new food to recipe:')
    select 'Orange', from: 'food[food_id]'
    fill_in 'quantity', with: '20'
    click_button 'Create'
    visit recipes_path
    click_link 'Show'
    expect(page).to have_content('Orange')
    expect(page).to have_content('20 kg')
    expect(page).to have_content('$100')
    click_link 'Modify'
    fill_in 'recipe_food[quantity]', with: '10'
    click_button 'Create'
    expect(page).to have_content('10 kg')
    expect(page).to have_content('$50')
  end
end
