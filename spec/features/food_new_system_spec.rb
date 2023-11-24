require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before :all do
    driven_by(:rack_test)
  end

  context 'add a new food page' do
    before :each do
      visit '/users/sign_up'
      within('#new_user') do
        fill_in 'user[name]', with: 'Marthekod'
        fill_in 'user[email]', with: 'marthekod@gmail.com'
        fill_in 'user[password]', with: 'ilovemywife'
        fill_in 'user[password_confirmation]', with: 'ilovemywife'
      end
      click_button 'Sign up'
    end

    it 'should render add new food view' do
      visit foods_path
      click_link('Add Food')

      expect(page).to have_field('Name')
      expect(page).to have_field('Measurement unit')
      expect(page).to have_field('Price')
      expect(page).to have_selector('input[name="commit"]')
    end

    it 'should display error messages on empty name' do
      visit foods_path
      click_link('Add Food')
      fill_in 'food[name]', with: ''
      select 'kg', from: 'food[measurement_unit]'
      fill_in 'food[price_dollars]', with: 5.50
      find('input[name="commit"]').click

      expect(page).to have_content('Name can\'t be blank')
    end

    it 'should display error messages on empty measurement unit' do
      visit foods_path
      click_link('Add Food')
      fill_in 'food[name]', with: 'Orange'
      select 'Select a unit', from: 'food[measurement_unit]'
      fill_in 'food[price_dollars]', with: 5.50
      find('input[name="commit"]').click

      expect(page).to have_content('Measurement unit can\'t be blank')
    end
  end
end
