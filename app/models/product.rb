class Product < ApplicationRecord
	has_many :purchases
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :stores
	has_and_belongs_to_many :images

	validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El cosot no debe ser vacio'}
	#validates_associated :Purchases

	def self.get_products
		include(:name,:description,:cost)
	end
end
