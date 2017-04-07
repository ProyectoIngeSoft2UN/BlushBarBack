class CategoriesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product, :category, presence: true

  def self.get_categoriesprodducts(page = 1, per_page = 10)
    select(:category_id,:product_id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_categories(id)
    includes(:category_id).where(product_id: id)
  end

  def self.get_produc(id)
    includes(:product_id).where(category_id: id)
  end
end
