class Purchase < ApplicationRecord
  belongs_to :client
  belongs_to :product

  validates :cost, presence: {message: 'Costo no debe ser vacio'}, numericality: true
  validates :client, presence: {message: 'IdCliente no debe ser vacio'}
  validates :product, presence: {message: 'IdProduct no debe ser vacio'}
  validates :payment, presence: {message: 'Payment no debe ser vacio'}
  validates :description, presence: true, allow_blank: true
  #validates_associated :client
  #validates_associated :products

  def self.get_purchases(page = 1, per_page = 10)
    select(:cost,:client,:product,:payment,:description)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_purchases_products
    include(:product,:cost,:payment,:description)
  end

  def self.get_client_by_id(q)
    includes(:client).where(id: q)
  end

  def self.get_product_by_id(q)
    includes(:product).where(id: q)
  end

  def self.get_purchases_by_payment(q)
    includes(:client).where(payment: q)
  end

end
