class StoresController < ApplicationController
	def index
		render json: Store.all, root: "data"
	end
	def list
		@store = Store.all
	end

	def show
		@store = Store.find(params[:id])
	end

	def new
		@store = Store.new
	end

	def create
		@store = Store.new(params[:store])
		if @store.save
			redirect_to @store
		else
			render "new"
		end
	end

	def edit
		@store = Store.find(params[:id])
	end

	def update
		@store = Store.find(params[:id])
		@admin.update(address: params[:cc], city: params[:city], phone: params[:phone], email: params[:email], admin: params[:admin])

	end

	def delete
		@store = store.find(params[:id])
		@store.destroy
		redirect_to action: "list"

	end

	def get_stores
		@store = Store.get_stores(params[:page],params[:paginate])
	end

	def get_by_city
		@store = Store.get_by_city(params[:city])
	end

	def get_by_address
		@store = Store.get_by_address(params[:address])
	end

	def get_by_email
		@store = Store.get_by_email(params[:email])
	end

	def get_by_phone
		@store = Store.get_by_phone(params[:phone])
	end

	def get_admin_of
		@store = Store.get_admin_of(params[:id])
	end

	def get_employees_of
		@store = Store.get_employees_of(params[:id])
	end

	def get_address_of
		@store = Store.get_address_of(params[:address])
	end

	def get_city_of
		@store = Store.get_city_of(params[:city])
	end

	def get_phone_of
		@store = Store.get_phone_of(params[:phone])
	end

	def get_email_of
		@store = Store.get_email_of(params[:email])
	end

	def get_available_of
		@store = Store.get_available_of(params[:productid])
	end

end
