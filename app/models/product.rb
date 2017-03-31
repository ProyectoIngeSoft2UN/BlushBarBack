class Product < ApplicationRecord
	belongs_to :Store
	has_many :Images
	has_many :Purchases
	has_and_belongs_to_many :Categories
	has_and_belongs_to_many :Images

	def self.get_products
		include(:name,:description,:cost)
	end
end
