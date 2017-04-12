class EmployeesController < ApplicationController
	def index
		render json: Employee.all, root: "data"
	end
	def list
		@employee = Employee.all
	end

	def show
		@employee = Employee.find(params[:id])
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
end
