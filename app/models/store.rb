class Store < ApplicationRecord
  belongs_to :admin
  has_many :employees
  has_and_belongs_to_many :products

  validates :address, presence: {message: 'La direccion no debe ser vacia'}
  validates :city, presence: {message: 'La ciudad no debe ser vacia'}
  validates :phone, presence: {message: 'El telefono no debe ser vacio'}
  validates :email, presence: {message: 'El correo no debe ser vacio'}, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :admin, presence: {message: 'El IdAdmin no debe ser vacio'}
  #validates_associated :employees
	#validates_associated :products


  def self.get_by_city(city)
    where(city: city)
  end

  def self.get_by_address(city)
    where(address: city)
  end

  def self.get_by_email(city)
    where(email: city)
  end

  def self.get_by_phone(city)
    where(phone: city)
  end

	def self.get_stores
		select(:address,:city,:phone,:email,:admin)
	end

  def self.get_admin_of(id)
    includes(:admin).where(admin: id)
  end

  def self.get_employees_of(id)
    includes(:employees).where(id: id)
  end

  def self.get_products_in(id)
    includes(:products).where(id: id)
  end

  def self.get_address(id)
    select(:address).where(id: id)
  end

  def self.get_city(id)
    select(:city).where(id: id)
  end

  def self.get_phone(id)
    select(:phone).where(id: id)
  end

  def self.get_email(id)
    select(:email).where(id: id)
  end
end
