class Admin < ApplicationRecord
  belongs_to :Store
  has_one :Image

  validates :name,  presence: true
  validates :lastname,  presence: true
  validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :phone, presence: true
  def self.load_admins
    includes(:name,:lastName,:email,:phone,:photo,store:[:address, :city])
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
  end

  def self.get_my_employees
    joins(:employee).where
    .group("employee.Store")
  end

  def self.get_employees_stores
    joins(:employee).select("employee.*")
    .group("employee.Store")
  end

  def self.get_clients
    joins(:client).select("client.*")
  end

  def self.get_stores
    joins(:store).select("store.*")
  end

  def self.get_users_by_posts(page = 1, per_page = 10)
    joins(:purchase).select("purchase.*")
    .paginate(:page => page,:per_page => per_page)
  end
end
