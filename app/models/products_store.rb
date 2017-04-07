class ProductsStore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product, :store, presence: true

  def self.get_stores(id)
    select(:store_id).where(product_id: id)
  end

  def self.get_produc(id)
    select(:product_id).where(store_id: id)
  end
end
