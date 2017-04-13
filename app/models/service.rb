class Service < ApplicationRecord
	has_many :appointments

	validates :name, :description, presence: true
	validates :description
	validates :cost

	def self.get_services(page,per_page)
		select(:name,:description,:cost)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_service_by_name(name)
		where(name: name)
	end

	def self.get_appointments_by_id(id)
		includes(:appointments).where(id: id)
	end

	def self.get_appointments_by_name(name)
		includes(:appointments).where(name: name)
	end
end
