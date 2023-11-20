require 'rails_helper'

RSpec.describe Recipe, type: :model do
  @user = User.new(name: 'pepe', email: 'email1@email.com', password: 'abcdef')

  subject do
    described_class.new(
      user: @user,
      name: 'Delicious Recipe',
      description: 'A tasty dish!',
      preparation_time_hours: 1.5,
      cooking_time_hours: 1.0,
      public: true
    )
  end

  before { subject.save }

  it { should belong_to(:user) }
  it { should have_many(:recipe_foods).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(250) }
  it { should validate_length_of(:description).is_at_most(2000) }
  it { should validate_numericality_of(:preparation_time_hours).is_greater_than_or_equal_to(0.0) }
  it { should validate_numericality_of(:cooking_time_hours).is_greater_than_or_equal_to(0.0) }
  it { should validate_inclusion_of(:public).in_array([true, false]) }
  it { should validate_exclusion_of(:public).in_array([nil]) }
end
