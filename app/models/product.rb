class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :stockstores
  has_many :references
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :images

  validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El costo no debe ser vacio'}
	validates :subcategory_id , numericality: { only_integer: true}, presence: true
  validates :brand, presence: {message: 'Marca no debe estar vacio'}

	def self.get_products(page, per_page)
		select(:id,:name,:description,:cost,:brand,:subcategory_id)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_cost_by_name(q)
		select(:cost).where(name: q)
	end

	def self.get_cost_by_id(q)
		select(:id,:cost).where(id: q)
	end

	def self.get_description_by_name(q)
		select(:description).where(name: q)
	end

	def self.get_description_by_id(q)
		select(:description).where(id: q)
	end

  def self.get_brand_by_id(id)
    select(:brand).where(id: id)
  end

  def self.get_brand_by_name(name)
    select(:brand).where(name: name)
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

	def self.get_subcategories_by_id(id)
		includes(:subcategory).where(id: id)
	end

  def self.get_subcategories_by_name(name)
		includes(:subcategory).where(name: name)
	end

	def self.get_images_by_id(id)
		includes(:images).where(id: id)
	end

  def self.get_images_by_name(name)
		includes(:images).where(name: name)
	end

  def self.get_references_by_id(id)
    includes(:references).where(id: id)
  end

  def self.get_references_by_name(name)
    includes(:references).where(name: name)
  end
end
