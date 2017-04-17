class ProductsController < ApplicationController
	def index
		render json: Product.all, root: "data"
	end
	def list
		Product.index
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to @product
		else
			render "new"
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(name: params[:name], description: params[:description], cost: params[:cost])

	end

	def delete
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to action: "list"

	end

	def get_cost_by_name
		@product = Product.get_cost_by_name(params[:q])
	end

	def get_cost_by_id
		@product = Product.get_cost_by_id(params[:q])
	end

	def get_description_by_name
		@product = Product.get_description_by_name(params[:q])
	end

	def get_description_by_id
		@product = Product.get_description_by_id(params[:q])
	end

	def get_bills_by_name
		@product = Product.get_bills_by_name(params[:id])
	end

	def get_bills_by_id
		@product = Product.get_bills_by_id(params[:name])
	end

	def get_categories_by_name
		@product = Product.get_categories_by_name(params[:id])
	end

	def get_categories_by_id
		@product = Product.get_categories_by_id(params[:name])
	end

	def get_images_by_name
		@product = Product.get_images_by_name(params[:name])
	end

	def get_images_by_id
		@product = Product.get_images_by_id(params[:id])
	end
end
