class Product < ApplicationRecord
  belongs_to :category
  has_many :stock_stores
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :images

  validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El costo no debe ser vacio'}
	validates :category_id , numericality: { only_integer: true}, presence: true

	def self.get_products(page = 1, per_page = 10)
		select(:name,:description,:cost,:quantity,:available)
		.paginate(:page => page,:per_page => per_page)
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

	def self.get_appointments_by_client_id(q)
		includes(:appointments).where(id: q)
	end

	def self.get_categories_by_id(id)
		includes(:categories).where(cc: id)
	end

	def self.get_images_by_id(id)
		includes(:categories).where(images: id)
	end
end
