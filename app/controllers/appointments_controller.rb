class AppointmentsController < ApplicationController
	def list
		@appointment = Appointment.all
	end

	def show
		@appointment = Appointment.find(params[:id])
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
		@appointment.update(client: params[:client], employee: params[:employee], payment: params[:payment], active: params[:active])

	end

	def delete
		@appointment = Appointment.find(params[:id])
		@appointment.destroy
		redirect_to action: "list"

	end 
end
