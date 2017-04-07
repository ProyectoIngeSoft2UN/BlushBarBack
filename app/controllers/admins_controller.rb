class AdminsController < ApplicationController
	
	def list
		@admin = Admin.all
	end

	def show
		@admin = Admin.find(params[:id])
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(params[:admin])
		if @admin.save
			redirect_to @Admin
		else 
			render "new"
		end
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:id])
		@admin.update(cc: params[:cc], name: params[:name], lastName: params[:lastName], email: params[:email], password_digest: params[:password_digest], phone: params[:phone])

	end

	def delete
		@admin = Admin.find(params[:id])
		@admin.destroy
		redirect_to action: "list"

	end 

end
