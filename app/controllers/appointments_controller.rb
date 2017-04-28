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

end
