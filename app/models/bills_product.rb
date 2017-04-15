class BillsProduct < ApplicationRecord
  belongs_to :bill
  belongs_to :product

  validates :bill_id , numericality: { only_integer: true}, presence: true
  validates :product_id , numericality: { only_integer: true}, presence: true

  def self.get_bill_products(page,per_page)
    select(:bill_id, :product_id)
    .paginate(:page => page, :per_page => per_page)
  end

  def self.get_bills_of(id,page,per_page)
    select(:bill_id).where(product_id: id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_products_of(id,page,per_page)
    select(:product_id).where(bill_id: id)
    .paginate(:page => page,:per_page => per_page)
  end
end
