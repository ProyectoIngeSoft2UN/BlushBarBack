class Category < ApplicationRecord
	has_and_belongs_to_many :Products

	validates :name, presence: {message: 'Nombre no debe estar vacio'}
	validates :description, presence: {message: 'La descripccion no debe estar vacio'}

	def get_categories
		include(:name,:description)
	end

end
