class StoresController < ApplicationController
	def index
		render json: Store.all, root: "data"
	end
	def list
		@store = Store.all
	end

	def show
		@store = Store.find(params[:id])
		render json: @store
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
		render json: @store
	end

	def get_by_address
		@store = Store.get_by_address(params[:address])
		render json: @store
	end

	def get_by_email
		@store = Store.get_by_email(params[:email])
		render json: @store
	end

	def get_by_phone
		@store = Store.get_by_phone(params[:phone])
		render json: @store
	end
	#
	# def get_admin_of
	# 	@store = Store.get_admin_of(params[:id])
	# end
	#
	# def get_employees_of
	# 	@store = Store.get_employees_of(params[:id])
	# end
	#
	# def get_address_of
	# 	@store = Store.get_address_of(params[:address])
	# end
	#
	# def get_city_of
	# 	@store = Store.get_city_of(params[:city])
	# end
	#
	# def get_phone_of
	# 	@store = Store.get_phone_of(params[:phone])
	# end
	#
	# def get_email_of
	# 	@store = Store.get_email_of(params[:email])
	# end
	#
	# def get_available_of
	# 	@store = Store.get_available_of(params[:productid])
	# end

	def get_stores_query
		if params[:sort].present?
			s = params[:sort].split(',')
			@store = Store.get_stores_query(params[:q],s)
		else
			@store = Store.get_stores_query(params[:q])
		end
		if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
			i = []
			s.each do |e|
				if !Store.column_names.include?(e)
					i.push(e)
				end
			end
			render json: @store, fields: s, include: i
		else
			render json: @store
		end
	end

	def get_stores_by_address
		if params[:sort].present?
			s = params[:sort].split('-')
			@store = Store.get_stores_by_address(params[:q],s)
		else
			@store = Store.get_stores_by_address(params[:q])
		end
		render json: @store
	end

	def get_stores_by_city
		if params[:sort].present?
			s = params[:sort].split('-')
			@store = Store.get_stores_by_city(params[:q],s)
		else
			@store = Store.get_stores_by_city(params[:q])
		end
		render json: @store
	end

	def get_stores_by_phone
		if params[:sort].present?
			s = params[:sort].split('-')
			@store = Store.get_stores_by_phone(params[:q],s)
		else
			@store = Store.get_stores_by_phone(params[:q])
		end
		render json: @store
	end

	def get_stores_by_email
		if params[:sort].present?
			s = params[:sort].split('-')
			@store = Store.get_stores_by_email(params[:q],s)
		else
			@store = Store.get_stores_by_email(params[:q])
		end
		render json: @store
	end

end
