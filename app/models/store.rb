class Store < ApplicationRecord
	has_one :Admin
	has_many :Products
	has_many :Employees
	has_many :Purchases , through:Products

	def self.get_stores
		include(:address,:city,:phone,:email)
	end

end
