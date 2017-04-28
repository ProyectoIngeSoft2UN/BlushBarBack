class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :bills
	has_many :appointments

	validates :cc, presence: true, uniqueness: true
	validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
	validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
	validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
	validates :phone, presence: true, allow_blank: true
	validates :address, :city , presence: true, allow_blank: true

	def self.get_clients(page, per_page)
		select(:cc,:name,:lastName,:email,:phone)
		.paginate(:page => page,:per_page => per_page)
	end

  def self.get_clients_by_name(name,col = nil)
    if col.present?
      if  col.size == 2
        where('name ILIKE ?',"%#{name}%").order(col[1]+' DESC')
      else
        where('name ILIKE ?',"%#{name}%").order(col[0])
      end
    else
      where('name ILIKE ?',"%#{name}%")
    end
  end

  def self.get_clients_by_lastname(lastName,col = nil)
    if col.present?
      if  col.size == 2
        where('lastName ILIKE ?',"%#{lastName}%").order(col[1]+' DESC')
      else
        where('lastName ILIKE ?',"%#{lastName}%").order(col[0])
      end
    else
      where('lastName ILIKE ?',"%#{lastName}%")
    end
  end

  def self.get_clients_by_cc(cc,col = nil)
    if col.present?
      if  col.size == 2
        where('cc ILIKE ?',"%#{cc}%").order(col[1]+' DESC')
      else
        where('cc ILIKE ?',"%#{cc}%").order(col[0])
      end
    else
      where('cc ILIKE ?',"%#{cc}%")
    end
  end

  def self.get_clients_by_email(email,col = nil)
    if col.present?
      if  col.size == 2
        where('email ILIKE ?',"%#{email}%").order(col[1]+' DESC')
      else
        where('email ILIKE ?',"%#{email}%").order(col[0])
      end
    else
      where('email ILIKE ?',"%#{email}%")
    end
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

	def self.get_city_by_id(id)
		select(:city).where(id: id)
	end

	def self.get_city_by_cc(cc)
		select(:city).where(cc: cc)
	end

	def self.get_address_by_id(id)
		select(:address).where(id: id)
	end

	def self.get_address_by_id(cc)
		select(:address).where(cc: cc)
	end

	def self.get_appointments_by_client_id(q)
		includes(:appointments).where(id: q)
	end

	def self.get_appointments_by_client_cc(cc)
		includes(:appointments).where(cc: cc)
	end

	def self.get_bills_by_client_id(q)
		includes(:bills).where(id: q)
	end
#joins(:purchase).select(:client_id,'"purchases"."product"','"purchases"."payment"').where(purchases:{cc: q})
	def self.get_bills_by_client_cc(cc)
		includes(:bills).where(id: cc)
	end
end
