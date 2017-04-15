class Store < ApplicationRecord
  belongs_to :admin
  has_many :bills
  has_many :stockstores
  has_many :employees
  has_many :appointments
  has_many :products, through: :stockstores

  validates :address, presence: {message: 'La direccion no debe ser vacia'}
  validates :city, presence: {message: 'La ciudad no debe ser vacia'}
  validates :phone, presence: true, numericality: { only_integer: true}
  validates :email, presence: {message: 'El correo no debe ser vacio'}, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :admin_id,presence: true, numericality: { only_integer: true}
  #validates_associated :employees
	#validates_associated :products

  def self.get_stores(page, paginate)
		select(:address,:city,:phone,:email,:admin)
    .paginate(:page => page,:per_page => per_page)
	end

  def self.get_by_city(city)
    where(city: city)
  end

  def self.get_by_address(address)
    where(address: address)
  end

  def self.get_by_email(email)
    where(email: email)
  end

  def self.get_by_phone(phone)
    where(phone: phone)
  end

  def self.get_admin_of(id)
    includes(:admin).where(admin: id)
  end

  def self.get_employees_of(id)
    includes(:employees).where(id: id)
  end

  def self.get_address_of(id)
    select(:address).where(id: id)
  end

  def self.get_city_of(id)
    select(:city).where(id: id)
  end

  def self.get_phone_of(id)
    select(:phone).where(id: id)
  end

  def self.get_email_of(id)
    select(:email).where(id: id)
  end

  def self.get_available_of(productid)
    includes(:stockstores).select(:available).where(product_id: productid, store_id: :id)
  end
end
