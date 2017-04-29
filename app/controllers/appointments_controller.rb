class AppointmentsController < ApplicationController
	def index
		render json: Appointment.all, root: "data"
	end
	def list
		@appointment = Appointment.all
	end

	def show
		@appointment = Appointment.find(params[:id])
		render json: @appointment
	end

	def new
		@appointment = Appointment.new
	end

	def create
		@appointment = Appointment.new(params[:appointment])
		if @appointment.save
			redirect_to @Appointment
		else
			render "new"
		end
	end

	def edit
		@appointment = Appointment.find(params[:id])
	end

	def update
		@appointment = Appointment.find(params[:id])
		@appointment.update(client: params[:client], employee: params[:employee], is_paid: params[:is_paid], active: params[:active])

	end

	def delete
		@appointment = Appointment.find(params[:id])
		@appointment.destroy
		redirect_to action: "list"

	end

	def get_appointments
		@appointment = Appointment.get_appointments(params[:page], params[:per_page])
	end

	def get_appointments_by_employee_id
		@appointment = Appointment.get_appointments_by_employee_id(params[:id],params[:page], params[:per_page])
		render json: @appointment
		end

	def get_appointments_by_client_id
		@appointment = Appointment.get_appointments_by_client_id(params[:id],params[:page], params[:per_page])
		render json: @appointment
	end

	def get_appointments_by_store_id
		@appointment = Appointment.get_store_by_employee_id(params[:id],params[:page], params[:per_page])
		render json: @appointment
	end

	def get_appointments_by_service_id
		@appointment = Appointment.get_appointments_by_service_id(params[:id],params[:page], params[:per_page])
		render json: @appointment
	end

	def is_paid
		@appointment = Appointment.is_paid(params[:id])
		render json: @appointment, fields: [:is_paid]
	end

	def is_active
		@appointment = Appointment.is_active(params[:id])
		render json: @appointment, fields: [:active]
	end

	def get_dateTime
		@appointment = Appointment.get_dateTime(params[:id])
		render json: @appointment, fields: [:dateTime]
	end

	def get_appointments_by_paid
		if params[:sort].present?
			s = params[:sort].split('-')
			@appointment = Appointment.get_appointments_by_paid(params[:q],s)
		else
			@appointment = Appointment.get_appointments_by_paid(params[:q])
		end
		render json: @appointment
	end

	def get_appointments_by_active
		if params[:sort].present?
			s = params[:sort].split('-')
			@appointment = Appointment.get_appointments_by_active(params[:q],s)
		else
			@appointment = Appointment.get_appointments_by_active(params[:q])
		end
		render json: @appointment
	end

	def get_appointments_by_datetime
		if params[:sort].present?
			s = params[:sort].split('-')
			@appointment = Appointment.get_appointments_by_datetime(params[:q],s)
		else
			@appointment = Appointment.get_appointments_by_datetime(params[:q])
		end
		render json: @appointment
	end

	def get_appointments_query
		if params[:sort].present?
			s = params[:sort].split(',')
			@appointment = Appointment.get_appointments_query(params[:q],s)
		else
			@appointment = Appointment.get_appointments_query(params[:q])
		end
		if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
			i = []
			s.each do |e|
				if !Appointment.column_names.include?(e)
					i.push(e)
				end
			end
			render json: @appointment, fields: s, include: i
		else
			render json: @appointment
		end
	end

end
