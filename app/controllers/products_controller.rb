class ProductsController < ApplicationController
	def index
		@product = Product.get_products(1,16)
		render json: @product
	end
	def list
		Product.index
	end

	def show
		@product = Product.find(params[:id])
		render json: @product
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
		@product = Product.get_cost_by_name(params[:id])
		render json: @product, fields: [:cost]
	end

	def get_cost_by_id
		@product = Product.get_cost_by_id(params[:id])
		p @product
		render json: @product, fields: [:cost]
	end

	def get_description_by_name
		@product = Product.get_description_by_name(params[:q])
		render json: @product, fields: [:description]
	end

	def get_description_by_id
		@product = Product.get_description_by_id(params[:q])
		render json: @product, fields: [:description]
	end

	def get_bills_by_name
		@product = Product.get_bills_by_name(params[:id])
		#render json: @product, fields: [:bills]
	end

	def get_bills_by_id
		@product = Product.get_bills_by_id(params[:name])
	end

	def get_categories_by_name
		@product = Product.get_categories_by_name(params[:id])
		#render json: @product, fields: [:subcategory_id]
	end

	def get_categories_by_id
		@product = Product.get_categories_by_id(params[:name])
		#render json: @product, fields: [:subcategory_id]
	end

	def get_images_by_name
		@product = Product.get_images_by_name(params[:name])
		#render json: @product, fields: [:images]
	end

	def get_images_by_id
		@product = Product.get_images_by_id(params[:id])
		#render json: @product, fields: [images]
	end

	def get_products_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@product = Product.get_products_by_name(params[:name],s)
		else
			@product = Product.get_products_by_name(params[:name])
		end
		render json: @product
	end

	def get_products_by_brand
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@product = Product.get_products_by_brand(params[:brand],s)
		else
			@product = Product.get_products_by_brand(params[:brand])
		end
		render json: @product
	end

	def get_products_by_cost
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@product = Product.get_products_by_cost(params[:cost],s)
		else
			@product = Product.get_products_by_cost(params[:cost])
		end
		render json: @product
	end

	# def get_column_name
	# 	col = params[:column_name]
	# 	c = col.split('-')
	# 	p c
	# 	@product = Product.get_columns(c)
	# 	render json: @product#, fields: [col.to_sym]
	# end
end
