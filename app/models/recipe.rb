class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, length: { maximum: 2000 }
  validates :preparation_time_hours, numericality: { greater_than_or_equal_to: 0.00 }
  validates :cooking_time_hours, numericality: { greater_than_or_equal_to: 0.00 }
  validates :public, inclusion: { in: [true, false] }, exclusion: { in: [nil] }
end
