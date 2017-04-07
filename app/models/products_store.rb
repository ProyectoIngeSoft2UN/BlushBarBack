class ProductsStore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product, :store, presence: true

  def self.get_store_of(id)
    select(:store_id).where(product_id: id)
  end

  def self.get_products_in(id)
    select(:product_id).where(store_id: id)
  end
end
