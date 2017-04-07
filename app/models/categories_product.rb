class CategoriesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product, :category, presence: true

  def self.get_categories(id)
    includes(:category_id).where(product_id: id)
  end

  def self.get_produc(id)
    includes(:product_id).where(category_id: id)
  end
end
