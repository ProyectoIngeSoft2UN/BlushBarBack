class Category < ApplicationRecord
	has_many :subcategories
	has_many :products, through: :subcategories

	validates :name, presence: {message: 'Nombre no debe estar vacio'}
	validates :description, presence: {message: 'La descripccion no debe estar vacio'}

	def self.get_categories(page, per_page)
		select(:name,:description)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_subcategories_by_id(id, page,per_page)
		includes(:subcategories).where(id: id)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_subcategories_by_name(page,per_page,name)
		includes(:subcategories).where(name: name)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_description_by_name(cat)
		select(:description).where(name: cat)
	end

	def self.get_description_by_id(id)
		select(:name,:description).where(id: id)
	end

	def self.get_products_by_id(id)
    includes(:products).where(id: id)
  	end

	def self.get_products_by_name(name)
    includes(:products).where(name: name)
  end

end
