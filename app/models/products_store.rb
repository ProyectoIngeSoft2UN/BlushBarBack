class ProductsStore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product, :store, presence: true

  def self.get_productsstores(page = 1, per_page = 10)
    select(:product_id,:store_id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_store_of(id)
    select(:store_id).where(product_id: id)
  end

  def self.get_products_in(id)
    select(:product_id).where(store_id: id)
  end
end
