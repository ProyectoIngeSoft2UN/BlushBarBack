class Service < ApplicationRecord
	has_many :appointments

	validates :name, :description, presence: true
	validates :cost, numericality: true, presence: {message: 'El costo no debe ser vacio'}

	def self.get_services(page,per_page)
		select(:name,:description,:cost)
		.paginate(:page => page,:per_page => per_page)
	end

	def self.get_services_by_name(name,col = nil)
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

	def self.get_services_by_cost(cost,col = nil)
		if col.present?
			if  col.size == 2
				#where('CAST(cost AS TEXT) LIKE ?',"%#{cost}%").
				order(col[1]+' DESC')
			else
				#where('CAST(cost AS TEXT) LIKE ?',"%#{cost}%").
				order(col[0])
			end
		# else
		#   where('CAST (cost AS TEXT) LIKE ?',"%#{cost}%")
		end
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
