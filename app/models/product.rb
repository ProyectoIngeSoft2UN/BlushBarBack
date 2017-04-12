class Product < ApplicationRecord
  belongs_to :category
  has_many :stock_stores
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :images

  validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El cosot no debe ser vacio'}
end
