class Stockstore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :available
  validates :quantity

  def self.is_available_by_id(q)
    select(:available).where(id: q)
  end

  def self.get_quantity_by_id(q)
    select(:quantity).where(id: q)
  end

  def self.get_available_of(productid)
    includes(:product).where(product_id: productid)
  end

  def self.get_stores_of(storeid)
    includes(:store).where(store_id: storeid)
  end
end
