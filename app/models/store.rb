class Store < ApplicationRecord
	has_one :Admin
	has_many :Products
	has_many :Employees
	has_many :Purchases , through:Products

	validates :address, :city,:phone, presence: true
	validates :email presence: true,  format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
	#validates_associated
  validates_associated :Employees
	validates_associated :Products
		
	def self.get_stores
		include(:address,:city,:phone,:email)
	end

end
