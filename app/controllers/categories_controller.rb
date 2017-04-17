class CategoriesController < ApplicationController
	def index
		render json: Category.all, root: "data"
	end
	def list
		@category = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		if @admin.save
			redirect_to @Admin
		else
			render "new"
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(name: params[:name], description: params[:description])

	end

	def delete
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to action: "list"

	end

	def get_categories
		@category = Category.get_categories(params[:page],params[:per_page])
	end

	def get_description_by_name
		@category = Category.get_description_by_name(params[:cat])
	end

	def get_description_by_id
		@category = Category.get_description_by_id(params[:id])
	end

	def get_products_by_id
		@category = Category.get_products_by_id(params[:id])
	end

	def get_products_by_name
		@category = Category.get_products_by_name(params[:name])
	end
end
