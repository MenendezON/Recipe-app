require 'rails_helper'

RSpec.describe Food, type: :model do
  # Create a User record
  let(:user) { User.create(name: 'Binod', email: 'binod@email.com', password: 'password') }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'grams', price_dollars: 1.0) }

  it 'is valid with valid attributes' do
    expect(food).to be_valid
  end
  it 'is not valid without a name' do
    food = Food.new(measurement_unit: 'grams', price_dollars: 0.5)
    expect(food).not_to be_valid
  end
  it 'is not valid with a negative price_dollars' do
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price_dollars: -0.5)
    expect(food).not_to be_valid
  end
end
