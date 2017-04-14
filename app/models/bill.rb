class Bill < ApplicationRecord
  belongs_to :client
  belongs_to :store

  validates :cost, :client_id, :store_id , presence: true,numericality: { only_integer: true}
  validates :payment_method, presence: {message: 'Debe especificar el método de pago'}
  validates :description, presence: {message: 'Debe especificar una descripcion'}
end
