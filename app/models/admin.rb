class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_one :store

	validates :cc, presence: true, uniqueness: true
	validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
	validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
	validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
	validates :phone, presence: true

	def self.get_admins(page, per_page)
		select(:cc,:name,:lastName,:email,:phone)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_by_id(id)
		select(:cc,:name,:lastName,:email,:phone).where(id: id)
	end

	def self.get_by_cc(cc)
		select(:cc,:name,:lastName,:email,:phone).where(cc: cc)
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

	def self.get_store_by_id(id)
		includes(:store).where(id: id)
	end

	def self.get_store_by_cc(cc)
		includes(:store).where(cc: cc)
	end
end
