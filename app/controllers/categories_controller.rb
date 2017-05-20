class CategoriesController < ApplicationController
	def index
		render json: Category.all, root: "data"
	end
	def list
		@category = Category.all
	end

	def show
		@category = Category.find(params[:id])
		render json: @category
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(categories_params)
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
		render json: @category
	end

	# def get_description_by_name
	# 	@category = Category.get_description_by_name(params[:name])
	#
	# end
	#
	# def get_description_by_id
	# 	@category = Category.get_description_by_id(params[:id])
	# end
	#
	# def get_products_by_id
	# 	@category = Category.get_products_by_id(params[:id])
	# end
	#
	# def get_products_by_name
	# 	@category = Category.get_products_by_name(params[:name])
	# end

	def get_categories_query
		if params[:sort].present?
			s = params[:sort].split(',')
			@category = Category.get_categories_query(params[:q],s)
		else
			@category = Category.get_categories_query(params[:q])
		end
		if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
			i = []
			s.each do |e|
				if !Category.column_names.include?(e)
					i.push(e)
				end
			end
			render json: @category, fields: s, include: i
		else
			render json: @category
		end
	end
	private
		def categories_params
			params.permit(:name, :description)
		end
end
