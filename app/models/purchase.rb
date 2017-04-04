class Purchase < ApplicationRecord
  belongs_to :client
  belongs_to :product

  validates :cost, presence: {message: 'Costo no debe ser vacio'}, numericality: true
  validates :idProduct,:payment, presence: true
  validates :client, presence: {message: 'IdCliente no debe ser vacio'}
  validates :product, presence: {message: 'IdProduct no debe ser vacio'}
  validates :payment, presence: {message: 'Payment no debe ser vacio'}
  validates :description, allow_blank: true
  #validates_associated :client
  #validates_associated :products

  def self.get_purchases
    include(:idProduct,:cost,:payment,:description)
  end

  def self.get_purchases_products
    include(idProduct: [:name],:cost,:payment,:description)
  end
end
