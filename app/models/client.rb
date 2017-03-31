class Client < ApplicationRecord
	has_many :Purchases
	has_one :Image
	has_many :Appointments
	has_many :Products , through:Purchases
	has_many :Employees , through:Appointments

	def self.get_clients
		include(:name,:lastName,:email,:phone,:photo)
	end

	def self.get_products
		joins(:product).select("product.*")
	end

	def self.get_products_by_cost
		get_products.order(:cost)
	end

	def self.get_products_by_name
		get_products.order(:name)
	end

	def self.get_products_by_name_desc
		get_products.order(name: :desc)
	end

	def self.get_appointments
    joins(:appointment).select("appointment.*")
		.where(:id =>{:idClient})
  end
end
