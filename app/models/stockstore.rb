class Stockstore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product_id , presence: true,numericality: { only_integer: true}
  validates :store_id, presence: true, numericality: { only_integer: true}
  validates :available, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  validates :quantity, presence: true, numericality: { only_integer: true}

  def self.get_stockstores(page,per_page)
    includes(:product, :store)
		.paginate(:page => page,:per_page => per_page)
  end

  def self.is_available(q)
    select(:available).where(id: q)
  end

  def self.get_quantity(q)
    select(:quantity).where(id: q)
  end

  def self.get_available_of(productid)
    includes(:product).where(product_id: productid)
  end

  def self.get_stores_of(storeid)
    includes(:store).where(store_id: storeid)
  end
end
