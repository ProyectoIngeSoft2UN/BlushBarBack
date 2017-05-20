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
		@service = Service.new(service_params)
    p @service
		if @service.save
			redirect_to @service
		else
			render @service.errors.full_messages
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

  def get_services_query
    if params[:sort].present?
      s = params[:sort].split('-')
      @service = Service.get_services_query(params[:q],s)
    else
      @service = Service.get_services_query(params[:q])
    end
    if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
      i = []
      s.each do |e|
        if !Service.column_names.include?(e)
          i.push(e)
        end
      end
			render json: @service, fields: s, include: i
		else
			render json: @service
		end
  end

  def get_services_by_name
    if params[:sort].present?
      s = params[:sort].split('-')
      @service = Service.get_services_by_name(params[:q],s)
    else
      @service = Service.get_services_by_name(params[:q])
    end
    render json: @service
  end

  def get_services_by_cost
    if params[:sort].present?
      s = params[:sort].split('-')
      @service = Service.get_services_by_cost(params[:q],s)
    else
      @service = Service.get_services_by_cost(params[:q])
    end
    render json: @service
  end

  private
    def service_params
      params.permit(:name, :cost, :description)
    end

end
