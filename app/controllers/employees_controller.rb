class EmployeesController < ApplicationController
	def index
		render json: Employee.all, root: "data"
	end
	def list
		@employee = Employee.all
	end

	def show
		@employee = Employee.find(params[:id])
		render json: @employee
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = employee.new(params[:employee])
		if @employee.save
			redirect_to @Employee
		else
			render "new"
		end
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
		@employee.update(cc: params[:cc], name: params[:name], lastName: params[:lastName], email: params[:email], password_digest: params[:password_digest], phone: params[:phone])

	end

	def delete
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to action: "list"

	end

	# 	def get_employees
	# 	@employee = Employee.get_employees(params[:page],params[:per_page])
	# end
	#
	# def get_by_id
	# 	@employee = Employee.get_by_id(params[:id])
	# 	render json: @employee
	# end
	#
	# def get_by_cc
	# 	@employee = Employee.get_by_cc(params[:cc])
	# 	render json: @employee
	# end
	#
	# def get_name_by_id
	# 	@employee = Employee.get_name_by_id(params[:id])
	# end
	#
	# def get_name_by_cc
	# 	@employee = Employee.get_name_by_cc(params[:cc])
	# end
	#
	# def get_lastName_by_id
	# 	@employee = Employee.get_lastName_by_id(params[:id])
	# end
	#
	# def get_lastName_by_cc
	# 	@employee = Employee.get_lastName_by_cc(params[:cc])
	# end
	#
	# def get_email_by_id
	# 	@employee = Employee.get_email_by_id(params[:id])
	# end
	#
	# def get_email_by_cc
	# 	@employee = Employee.get_email_by_cc(params[:cc])
	# end
	#
	# def get_phone_by_id
	# 	@employee = Employee.get_phone_by_id(params[:id])
	# end
	#
	# def get_phone_by_cc
	# 	@employee = Employee.get_phone_by_cc(params[:cc])
	# end
	#
	# def get_appointments_by_employee_id
	# 	@employee = Employee.get_appointments_by_employee_id(params[:q])
	# end
	#
	# def get_appointments_by_employee_cc
	# 	@employee = Employee.get_appointments_by_employee_cc(params[:cc])
	# end
	#
	# def get_store_by_id
	# 	@employee = Employee.get_store_by_id(params[:id])
	# end
	#
	# def get_store_by_cc
	# 	@employee = Employee.get_store_by_cc(params[:cc])
	# end

	def get_employees_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@employee = Employee.get_employees_by_name(params[:name],s)
		else
			@employee = Employee.get_employees_by_name(params[:name])
		end
		render json: @employee
	end

	def get_employees_by_lastname
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@employee = Employee.get_employees_by_lastname(params[:lastName],s)
		else
			@employee = Employee.get_employees_by_lastname(params[:lastName])
		end
		render json: @employee
	end

	def get_employees_by_cc
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@employee = Employee.get_employees_by_cc(params[:cc],s)
		else
			@employee = Employee.get_employees_by_cc(params[:cc])
		end
		render json: @employee
	end

	def get_employees_by_email
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@employee = Employee.get_employees_by_email(params[:email],s)
		else
			@employee = Employee.get_employees_by_email(params[:email])
		end
		render json: @employee
	end
end
