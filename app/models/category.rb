class Category < ApplicationRecord
	has_many :products

	validates :name, presence: {message: 'Nombre no debe estar vacio'}
	validates :description, presence: {message: 'La descripccion no debe estar vacio'}
end
