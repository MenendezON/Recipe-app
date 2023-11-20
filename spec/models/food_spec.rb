require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { described_class.new(name: 'Carrot', measurement_unit: 'Piece', price_dollars: 2) }

  before { subject.save }

  it { should have_many(:recipe_foods).dependent(:destroy) }
  it { should have_many(:inventory_foods).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(250) }
  it { should validate_presence_of(:measurement_unit) }
  it { should validate_presence_of(:price_dollars) }
  it { should validate_numericality_of(:price_dollars).is_greater_than(0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
