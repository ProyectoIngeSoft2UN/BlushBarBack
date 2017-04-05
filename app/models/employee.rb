class Employee < ApplicationRecord
  has_secure_password
  belongs_to :store
  has_many :appointments

  validates :cc, presence: true
  validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
  validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
  validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
  validates :phone, presence: true,  format: { with:  /[0-9]*/, message: "Phone must be a number" }
  #validates_associated :appointments

  def self.get_employees
    select(:cc,:name,:lastName,:email,:phone,:store_id)
  end

  def self.get_by_id(id)
    select(:cc,:name,:lastName,:email,:phone,:store).where(id: id)
  end

  def self.get_by_cc(cc)
    select(:cc,:name,:lastName,:email,:phone,:store).where(cc: cc)
  end

end
