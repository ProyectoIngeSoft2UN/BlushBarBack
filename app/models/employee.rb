class Employee < ApplicationRecord
  belongs_to :store
  has_many :appointments

  validates :cc, presence: true, uniqueness: true
  validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
  validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
  validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :phone, presence: true, numericality: { only_integer: true}
  validates :store_id,presence: true, numericality: { only_integer: true}
  #validates_associated :appointments

  def self.get_employees(page = 1, per_page = 10)
    select(:cc,:name,:lastName,:email,:phone,:store_id)
    .paginate(:page => page,:per_page => per_page)
  end

  def self.get_by_id(id)
    select(:cc,:name,:lastName,:email,:phone,:store).where(id: id)
  end

  def self.get_by_cc(cc)
    select(:cc,:name,:lastName,:email,:phone,:store).where(cc: cc)
  end

  def self.get_name_by_id(id)
    select(:name).where(id: id)
  end

  def self.get_name_by_cc(cc)
    select(:name).where(cc: cc)
  end

  def self.get_lastName_by_id(id)
    select(:lastName).where(id: id)
  end

  def self.get_lastName_by_cc(cc)
    select(:lastName).where(cc: cc)
  end

  def self.get_email_by_id(id)
    select(:email).where(id: id)
  end

  def self.get_email_by_cc(cc)
    select(:email).where(cc: cc)
  end

  def self.get_phone_by_id(id)
    select(:phone).where(id: id)
  end

  def self.get_phone_by_cc(cc)
    select(:phone).where(cc: cc)
  end

  def self.get_appointments_by_employee_id(q)
    includes(:appointments).where(id: q)
  end

  def self.get_appointments_by_employee_cc(cc)
    includes(:appointments).where(cc: cc)
  end

  def self.get_store_by_id(id)
    includes(:store).where(id: id)
  end

  def self.get_store_by_cc(cc)
    includes(:store).where(cc: cc)
  end
end
