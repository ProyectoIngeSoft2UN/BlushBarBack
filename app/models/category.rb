class Category < ApplicationRecord
	has_and_belongs_to_many :products

	validates :name, presence: {message: 'Nombre no debe estar vacio'}
	validates :description, presence: {message: 'La descripccion no debe estar vacio'}

	def self.get_categories
		select(:name)
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
