class Store < ApplicationRecord
  belongs_to :admin
  has_many :bills
  has_many :stock_stores
  has_many :employees
  has_many :appointments

  validates :address, presence: {message: 'La direccion no debe ser vacia'}
  validates :city, presence: {message: 'La ciudad no debe ser vacia'}
  validates :phone, presence: {message: 'El telefono no debe ser vacio'}
  validates :email, presence: {message: 'El correo no debe ser vacio'}, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :admin, presence: {message: 'El IdAdmin no debe ser vacio'}
end
