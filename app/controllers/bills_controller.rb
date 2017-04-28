class BillsController < ApplicationController
  def index
    render json: Bill.all, root: "data"
  end

  def list
		@bill = Bill.all
	end

	def show
		@bill = Bill.find(params[:id])
    render json: @bill
	end

	def new
		@bill = Bill.new
	end

	def create
		@bill = Bill.new(params[:bill])
		if @bill.save
			redirect_to @bill
		else
			render "new"
		end
	end

	def edit
		@bill = Bill.find(params[:id])
	end

	def update
		@bill = Bill.find(params[:id])
		@bill.update(client: params[:client], employee: params[:employee], payment: params[:payment], active: params[:active])

	end

	def delete
		@bill = Bill.find(params[:id])
		@bill.destroy
		redirect_to action: "list"

	end

	def get_bills
		@bill = Bill.get_bills(params[:page], params[:per_page])
    render json: @bill, fields: [:page, :per_page]
	end

	def get_bills_by_client_id
		@bill = Bill.get_bills_by_client_id(params[:id],params[:page], params[:per_page])
    render json: @bill, fields: [:id, :page, :per_page]
	end

	def get_bills_by_client_cc
		@bill = Bill.get_bills_by_client_cc(params[:cc],params[:page], params[:per_page])
    render json: @bill, fields: [:cc, :page, :per_page]
	end

	def get_bills_by_store_id
		@bill = Bill.get_bills_by_store_id(params[:id],params[:page], params[:per_page])
    render json: @bill, fields: [:id, :page, :per_page]
	end

	def get_bills_by_payment_method
		@bill = Bill.get_bills_by_payment_method(params[:pm],params[:page], params[:per_page])
    render json: @bill, fields: [:pm, :page, :per_page]
	end

	def get_bills_by_cost
		@bill = Bill.get_bills_by_cost(params[:cost],params[:page], params[:per_page])
    render json: @bill, fields: [:cost, :page, :per_page]
	end
end
