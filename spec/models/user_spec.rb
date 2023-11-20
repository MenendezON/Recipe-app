require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Naveed') }

  before { subject.save }

  it { should have_many(:recipes).dependent(:destroy) }
  it { should have_many(:inventories).dependent(:destroy) }

  it { should validate_presence_of(:name) }
end
