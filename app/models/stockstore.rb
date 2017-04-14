class Stockstore < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product_id , presence: true,numericality: { only_integer: true}
  validates :store_id, presence: true, numericality: { only_integer: true}
  validates :available, inclusion: { in: [true, false], message: 'Debe ser true o false'}
  validates :quantity, inclusion: { in: [true, false], message: 'Debe ser true o false'}
end
