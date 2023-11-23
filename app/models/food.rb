class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true
  validates :price_dollars, numericality: { greater_than: 0, message: 'must be greater than 0' }
end
