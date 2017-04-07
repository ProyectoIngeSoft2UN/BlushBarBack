class Image < ApplicationRecord
	has_and_belongs_to_many :products

	validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'La descripcion no debe ser vacia'}

	def self.get_images(page = 1, per_page = 10)
		select(:name, :description)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_name(id)
    select(:name).where(id: id)
  end

	def self.get_description(id)
    select(:description).where(id: id)
  end

	def self.get_products_by_id(id)
    includes(:products).where(id: id)
  end

	def self.get_products_by_name(name)
    includes(:products).where(name: name)
  end
end
