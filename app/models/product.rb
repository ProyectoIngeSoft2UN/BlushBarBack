class Product < ApplicationRecord
	has_many :purchases
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :stores
	has_and_belongs_to_many :images

	validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El cosot no debe ser vacio'}
	#validates :quantity, numericality: true, presence: {message: 'El cosot no debe ser vacio'}
	#validates_associated :Purchases

	def self.get_products
		select(:name,:description,:cost,:quantity,:available)
	end

	def self.is_available_by_name(q)
		select(:available).where(name: q)
	end

	def self.is_available_by_id(q)
		select(:available).where(id: q)
	end

	def self.get_quantity_by_name(q)
		select(:quantity).where(name: q)
	end

	def self.get_quantity_by_id(q)
		select(:quantity).where(id: q)
	end

	def self.get_cost_by_name(q)
		select(:quantity).where(name: q)
	end

	def self.get_cost_by_id(q)
		select(:quantity).where(id: q)
	end

	def self.get_description_by_name(q)
		select(:description).where(name: q)
	end

	def self.get_description_by_id(q)
		select(:description).where(id: q)
	end
end
