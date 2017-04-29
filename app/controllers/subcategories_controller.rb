class SubcategoriesController < ApplicationController

	def index
		render json: Subcategory.all, root: "data"
	end
	def list
		@subcategory = Subcategory.all
	end

	def show
		@subcategory = Subcategory.find(params[:id])
		render json: @subcategory
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
	#
	# def get_description_by_name
	# 	@subcategory = Subcategory.get_description_by_name(params[:name])
	# end
	#
	# def get_description_by_id
	# 	@subcategory = Subcategory.get_description_by_id(params[:id])
	# end
	#
	# def get_products_by_id
	# 	@subcategory = Subcategory.get_products_by_id(params[:id])
	# end
	#
	# def get_products_by_name
	# 	@subcategory = Subcategory.get_products_by_name(params[:name])
	# end

	def get_subcategories_query
		if params[:sort].present?
			s = params[:sort].split('-')
			@subcategory = Subcategory.get_subcategories_query(params[:q],s)
		else
			@subcategory = Subcategory.get_subcategories_query(params[:q])
		end
		if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
			i = []
			s.each do |e|
				if !Subcategory.column_names.include?(e)
					i.push(e)
				end
			end
			render json: @subcategory, fields: s, include: i
		else
			render json: @subcategory
		end
	end

	def get_subcategories_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			@subcategory = Subcategory.get_subcategories_by_name(params[:q],s)
		else
			@subcategory = Subcategory.get_subcategories_by_name(params[:q])
		end
		render json: @subcategory
	end
end
