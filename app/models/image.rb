class Image < ApplicationRecord
	has_and_belongs_to_many :products

	validates :name, presence: {message: 'Nombre no debe ser vacio'}
	validates :description, presence: {message: 'La descripcion no debe ser vacia'}

	def self.get_name(id)
    select(:name).where(id: id)
  end

	def self.get_description(id)
    select(:description).where(id: id)
  end
end
