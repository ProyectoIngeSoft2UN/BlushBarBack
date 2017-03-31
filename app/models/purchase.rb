class Purchase < ApplicationRecord
	has_many :Clients
	has_many :Products
	#Local validations
	validates :cost, presence: true, numericality: true
	validates :idProduct,:payment, presence: true

	#validates_associated
	validates_associated :Client
	validates_associated :Products
	
	def self.get_purchases
		include(:idProduct,:cost,:payment,:description)
	end

	def self.get_purchases_products
		include(idProduct: [:name],:cost,:payment,:description)
	end
end
