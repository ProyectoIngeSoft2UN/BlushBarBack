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
		@reference = Reference.new(params[:reference])
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

	def get_references_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@reference = Reference.get_references_by_name(params[:name],s)
		else
			@reference = Reference.get_references_by_name(params[:name])
		end
		render json: @reference
	end

end
