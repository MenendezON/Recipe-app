require 'rails_helper'

RSpec.describe Inventory, type: :model do
  @user = User.new(name: 'pepe', email: 'email1@email.com', password: 'abcdef')

  subject do
    described_class.new(
      user: @user,
      name: 'My Kitchen Inventory'
    )
  end

  before { subject.save }

  it { should belong_to(:user) }
  it { should have_many(:inventory_foods).dependent(:destroy) }

  it { should validate_presence_of(:name) }
end
