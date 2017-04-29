class StockstoresController < ApplicationController
  def index
    render json: Stockstore.all, root: "data"
  end
  	def list
		@stockstore = Stockstore.all
	end

	def show
		@stockstore = Stockstore.find(params[:id])
    render json: @stockstore
	end

	def new
		@stockstore = Stockstore.new
	end

	def create
		@stockstore = Stockstore.new(params[:stockstore])
		if @stockstore.save
			redirect_to @Stockstore
		else
			render "new"
		end
	end

	def edit
		@stockstore = Stockstore.find(params[:id])
	end

	def update
		@stockstore = Stockstore.find(params[:id])
		@stockstore.update(client: params[:client], employee: params[:employee], payment: params[:payment], active: params[:active])

	end

	def delete
		@stockstore = Stockstore.find(params[:id])
		@stockstore.destroy
		redirect_to action: "list"
	end
  #
	# def is_available_by_id
	# 	@stockstore = Stockstore.is_available_by_id(params[:q])
	# end
  #
	# def get_quantity_by_id
	# 	@stockstore = Stockstore.get_quantity_by_id(params[:q])
	# end
  #
	# def get_available_of
	# 	@stockstore = Stockstore.get_available_of(params[:productid])
	# end
  #
	# def get_stores_of
	# 	@stockstore = Stockstore.get_stores_of(params[:storeid])
	# end
  #

  def get_stockstores_by_available
    if params[:sort].present?
      s = params[:sort].split('-')
      @stockstore = Stockstore.get_stockstores_by_available(params[:q],s)
    else
      @stockstore = Stockstore.get_stockstores_by_available(params[:q])
    end
    render json: @stockstore
  end

  def get_products_by_cost
    if params[:sort].present?
      s = params[:sort].split('-')
      @stockstore = Stockstore.get_stockstores_by_cost(params[:q],s)
    else
      @stockstore = Stockstore.get_stockstores_by_cost(params[:q])
    end
    render json: @stockstore
  end

end
