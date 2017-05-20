class ReferencesController < ApplicationController
	def index
		@reference = Reference.get_references(1,16)
		render json: @reference
	end
	def list
		Reference.index
	end

	def show
		@reference = Reference.find(params[:id])
		render json: @reference
	end

	def new
		@reference = Reference.new
	end

	def create
		@reference = Reference.new(references_params)
		if @reference.save
			redirect_to @reference
		else
			render "new"
		end
	end

	def edit
		@reference = Reference.find(params[:id])
	end

	def update
	end

	def delete
		@reference = Reference.find(params[:id])
		@reference.destroy
		redirect_to action: "list"

	end

	def get_images_by_id
		@reference = Reference.get_images_by_id(params[:id])
	end

	def get_references_query
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@reference = Reference.get_references_query(params[:q],s)
		else
			@reference = Reference.get_references_query(params[:q])
		end
		if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
			i = []
			s.each do |e|
				if !Reference.column_names.include?(e)
					i.push(e)
				end
			end
			render json: @reference, fields: s, include: i
		else
			render json: @reference
		end
	end

	def get_references_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@reference = Reference.get_references_by_name(params[:q],s)
		else
			@reference = Reference.get_references_by_name(params[:q])
		end
		render json: @reference
	end
	private
		def references_params
			params.permit(:name, :product_id, :description)
		end
end
