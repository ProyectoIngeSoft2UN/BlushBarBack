class ProductsController < ApplicationController
	def index
		render json: Product.all, root: "data"
	end
	def list
		@product = Product.all
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
end
