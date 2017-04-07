class CategoriesController < ApplicationController
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
end
