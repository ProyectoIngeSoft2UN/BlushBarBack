class Image < ApplicationRecord
	has_and_belongs_to_many :products

	validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'La descripcion no debe ser vacia'}
end
