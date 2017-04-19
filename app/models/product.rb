class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :stockstores
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :images

  validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El costo no debe ser vacio'}
	validates :subcategory_id , numericality: { only_integer: true}, presence: true

	def self.get_products(page, per_page)
		select(:name,:description,:cost)
		.paginate(:page => page,:per_page => per_page)
	end

  # def self.get_products(per_page)
  #   prod_per_page = Product.count/per_page
  #   puts prod_per_page
  #   select(:name,:description,:cost)
  #   .paginate(:page => prod_per_page,:per_page => per_page)
  # end

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

	def self.get_bills_by_id(id)
		includes(:bills).where(id: id)
	end

  def self.get_bills_by_name(name)
		includes(:bills).where(name: name)
	end
#MOD
	def self.get_categories_by_id(id)
		includes(:category).where(id: id)
	end
#MOD
  def self.get_categories_by_name(name)
		includes(:category).where(name: name)
	end

	def self.get_images_by_id(id)
		includes(:images).where(id: id)
	end

  def self.get_images_by_name(name)
		includes(:images).where(name: name)
	end
end
