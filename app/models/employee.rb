class Employee < ApplicationRecord
  belongs_to :Store
  has_one :Image
  has_many :Appointments
  has_many :Clients , through:Appointments

  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true,  format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :phone, presence: true

  #validates_associated
  validates_associated :Appointments

  def self.get_employees
		include(:name,:lastName,:email,:phone,:photo,store:[:address, :city])
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
		.where(:id =>:idEmployee)
  end
end
