class SubcategoriesController < ApplicationController

	def index
		render json: Subcategory.all, root: "data"
	end
	def list
		@subcategory = Subcategory.all
	end

	def show
		@subcategory = Subcategory.find(params[:id])
	end

	def new
		@subcategory = Subcategory.new
	end

	def create
		@subcategory = Subcategory.new(params[:subcategory])
		if @subcategory.save
			redirect_to @subcategory
		else
			render "new"
		end
	end

	def edit
		@subcategory = Subcategory.find(params[:id])
	end

	def update
		@subcategory = Subcategory.find(params[:id])
		@admin.update(name: params[:name], description: params[:description], category: params[:category])

	end

	def delete
		@subcategory = subcategory.find(params[:id])
		@subcategory.destroy
		redirect_to action: "list"

	end

	def get_subcategories
		@subcategory = Subcategory.get_subcategories(params[:page],params[:per_page])
	end

	def get_description_by_name
		@subcategory = Subcategory.get_description_by_name(params[:name])
	end

	def get_description_by_id
		@subcategory = Subcategory.get_description_by_id(params[:id])
	end

	def get_products_by_id
		@subcategory = Subcategory.get_products_by_id(params[:id])
	end

	def get_products_by_name
		@subcategory = Subcategory.get_products_by_name(params[:name])
	end
end
