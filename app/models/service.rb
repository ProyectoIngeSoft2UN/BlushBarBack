class Service < ApplicationRecord
	has_many :appointments

	validates :name, :description, presence: true
	validates :cost, numericality: true, presence: {message: 'El costo no debe ser vacio'}
end
