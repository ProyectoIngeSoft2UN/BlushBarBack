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
end
