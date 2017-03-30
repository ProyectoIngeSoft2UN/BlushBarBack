class Client < ApplicationRecord
	has_many :Purchases
	has_one :Image
	has_many :Appointments
	has_many :Products , through:Purchases
	has_many :Employees , through:Appointments
end
