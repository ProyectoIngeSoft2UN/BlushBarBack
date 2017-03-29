class Product < ApplicationRecord
	belongs_to :Store
	has_many :Categories
	has_many :Images
	has_many :Purchases
end
