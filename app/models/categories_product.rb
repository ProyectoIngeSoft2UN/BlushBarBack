class CategoriesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product, :category, presence: true
end
