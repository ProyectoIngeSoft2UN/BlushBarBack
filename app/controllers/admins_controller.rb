class AdminsController < ApplicationController

	def index
		render json: Admin.all
	end

	def list
		@admin = Admin.all

	end

	def show
		@admin = Admin.find(params[:id])
		render json: @admin
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

	def get_by_id
		@admin = Admin.get_by_id(params[:id])
		render json: @admin
	end

	def get_by_cc
		@admin = Admin.get_by_id(params[:cc])
		render json: @admin
	end
	#
	# def get_name_by_id
	# 	@admin = Admin.get_name_by_id(params[:id])
	# end
	#
	# def get_name_by_cc
	# 	@admin = Admin.get_name_by_cc(params[:cc])
	# end
	#
	# def get_lastName_by_id
	# 	@admin = Admin.get_lastName_by_id(params[:id])
	# end
	#
	# def get_lastName_by_cc
	# 	@admin = Admin.get_lastName_by_cc(params[:cc])
	# end
	#
	# def get_email_by_id
	# 	@admin = Admin.get_email_by_id(params[:id])
	# end
	#
	# def get_email_by_cc
	# 	@admin = Admin.get_email_by_cc(params[:cc])
	# end
	#
	# def get_phone_by_id
	# 	@admin = Admin.get_phone_by_id(params[:id])
	# end
	#
	# def get_phone_by_cc
	# 	@admin = Admin.get_phone_by_cc(params[:cc])
	# end
	#
	# def get_store_by_id
	# 	@admin = Admin.get_store_by_id(params[:id])
	# end
	#
	# def get_store_by_cc
	# 	@admin = Admin.get_store_by_cc(params[:cc])
	# end

	def get_admins_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@admin = Admin.get_admins_by_name(params[:name],s)
		else
			@admin = Admin.get_admins_by_name(params[:name])
		end
		render json: @admin
	end

	def get_admins_by_lastname
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@admin = Admin.get_admins_by_lastname(params[:lastName],s)
		else
			@admin = Admin.get_admins_by_lastname(params[:lastName])
		end
		render json: @admin
	end

	def get_admins_by_cc
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@admin = Admin.get_admins_by_cc(params[:cc],s)
		else
			@admin = Admin.get_admins_by_cc(params[:cc])
		end
		render json: @admin
	end

	def get_admins_by_email
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@admin = Admin.get_admins_by_email(params[:email],s)
		else
			@admin = Admin.get_admins_by_email(params[:email])
		end
		render json: @admin
end
