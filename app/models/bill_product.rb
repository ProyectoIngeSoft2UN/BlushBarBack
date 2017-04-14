class BillProduct < ApplicationRecord
  belongs_to :bill
  belongs_to :product

  validates :bill_id , numericality: { only_integer: true}, presence: true
  validates :product_id , numericality: { only_integer: true}, presence: true
end
