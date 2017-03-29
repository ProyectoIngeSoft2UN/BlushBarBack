class Store < ApplicationRecord
	has_one :Admin
	has_many :Products
	has_many :Employees
	has_many :Purchases , through:Products
end
