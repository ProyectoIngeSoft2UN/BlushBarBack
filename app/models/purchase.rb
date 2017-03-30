class Purchase < ApplicationRecord
	has_many :Clients
	has_many :Products
end
