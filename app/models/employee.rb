class Employee < ApplicationRecord
  has_secure_password
  belongs_to :store
  has_many :appointments

  validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
  validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
  validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :phone, presence: true,  format: { with:  /[0-9]*/, message: "Phone must be a number" }
  #validates_associated :appointments

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
