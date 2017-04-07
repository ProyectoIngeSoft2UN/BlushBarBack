class CategoriesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product, :category, presence: true

  def self.get_categories(id)
    select(:category_id).where(product_id: id)
  end

  def self.get_produc(id)
    select(:product_id).where(category_id: id)
  end
end
