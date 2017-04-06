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

	def self.get_clients
		select(:cc,:name,:lastName,:email,:phone)
	end
	def self.get_by_id(id)
		select(:cc,:name,:lastName,:email,:phone).where(id: id)
	end

	def self.get_by_cc(cc)
		select(:cc,:name,:lastName,:email,:phone).where(cc: cc)
	end
	#Falla
	def self.get_appointments_by_client_id(q)
		self.joins(:appointments).select(:id,:payment).where(client_id: q)
	end
	#Falla
	def self.get_appointments_by_client_cc(q)
		joins(:appointments).select('"appointments"."payment"','"appointments"."payment"','"appointments"."active"').where(cc: q)
	end
	#Falla
	def self.get_purchases_by_client_id(q)
		joins(:purchase).select(:id,'"purchases"."product"','"purchases"."payment"').where(id: q)
	end
	#Falla
#joins(:purchase).select(:client_id,'"purchases"."product"','"purchases"."payment"').where(purchases:{cc: q})
	def self.get_purchases_by_client_cc(q)
		joins(:purchase).select(:id,'"purchases"."product"','"purchases"."payment"').where(cc: q)
	end
end
