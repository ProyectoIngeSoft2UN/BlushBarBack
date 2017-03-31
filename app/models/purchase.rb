class Purchase < ApplicationRecord
	has_many :Clients
	has_many :Products

	def self.get_purchases
		include(:idProduct,:cost,:payment,:description)
	end

	def self.get_purchases_products
		include(idProduct: [:name],:cost,:payment,:description)
	end
end
