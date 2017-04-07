class Client < ApplicationRecord
	has_secure_password
	has_many :purchases
	has_many :employees, through: :appointments
	has_many :appointments

	validates :cc, presence: true
	validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
	validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
	validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
	validates :phone, presence: true, allow_blank: true
	#validates :phone, presence: true,  format: { with:  /[0-9]*/, message: "Phone must be a number" }

	def self.get_clients(page = 1, per_page = 10)
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

	def self.get_appointments_by_client_id(q)
		includes(:appointments).where(id: q)
	end

	def self.get_appointments_by_client_cc(cc)
		includes(:appointments).where(cc: cc)
	end

	def self.get_purchases_by_client_id(q)
		includes(:purchases).where(id: q)
	end
#joins(:purchase).select(:client_id,'"purchases"."product"','"purchases"."payment"').where(purchases:{cc: q})
	def self.get_purchases_by_client_cc(cc)
		includes(:purchases).where(id: cc)
	end
end
