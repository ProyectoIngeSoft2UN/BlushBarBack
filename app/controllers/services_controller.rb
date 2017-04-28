class ServicesController < ApplicationController
  def index
    render json: Service.all, root: "data"
  end

  def list
		@service = Service.all
	end

	def show
		@service = Service.find(params[:id])
    render json: @service
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(params[:service])
		if @service.save
			redirect_to @service
		else
			render "new"
		end
	end

	def edit
		@service = Service.find(params[:id])
	end

	def update
		@service = Service.find(params[:id])
		@service.update(client: params[:client], employee: params[:employee], payment: params[:payment], active: params[:active])

	end

	def delete
		@service = Service.find(params[:id])
		@service.destroy
		redirect_to action: "list"

	end

	def get_services
		@service = Service.get_services(params[:page],params[:per_page])
    render json: @service
	end

	def get_service_by_name
		@service = Service.get_service_by_name(params[:name])
    render json: @service
	end

	# def get_appointments_by_id
	# 	@service = Service.get_appointments_by_id(params[:id])
	# end
  #
	# def get_appointments_by_name
	# 	@service = Service.get_appointments_by_name(params[:name])
	# end

  def get_services_by_name
    if params[:sort].present?
      s = params[:sort].split('-')
      @service = Service.get_services_by_name(params[:name],s)
    else
      @service = Service.get_services_by_name(params[:name])
    end
    render json: @service
  end

  def get_services_by_cost
    if params[:sort].present?
      s = params[:sort].split('-')
      @service = Service.get_services_by_cost(params[:cost],s)
    else
      @service = Service.get_services_by_cost(params[:cost])
    end
    render json: @service
  end

end
