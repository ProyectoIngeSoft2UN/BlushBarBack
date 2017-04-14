class Product < ApplicationRecord
  belongs_to :category
  has_many :stockstores
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :images

  mount_uploader :images, ImageUploader
  validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'Descripcion no debe ser vacia'}
	validates :cost, numericality: true, presence: {message: 'El cosot no debe ser vacio'}
	#validates :quantity, numericality: true, presence: {message: 'El cosot no debe ser vacio'}

	def self.get_products(page, per_page)
		select(:name,:description,:cost,:quantity,:available)
		.paginate(:page => page,:per_page => per_page)
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

	def self.get_bills_by_id(id)
		includes(:bills).where(id: id)
	end

  def self.get_bills_by_name(name)
		includes(:bills).where(name: name)
	end

	def self.get_categories_by_id(id)
		includes(:category).where(id: id)
	end

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
