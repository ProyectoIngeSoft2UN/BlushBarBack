class PurchasesController < ApplicationController
	def index
		render json: Purchase.all, root: "data"
	end
	def list
		@purchase = Purchase.all
	end

	def show
		@purchase = Purchase.find(params[:id])
	end

	def new
		@purchase = Purchase.new
	end

	def create
		@purchase = Purchase.new(params[:purchase])
		if @purchase.save
			redirect_to @purchase
		else
			render "new"
		end
	end

	def edit
		@purchase = Purchase.find(params[:id])
	end

	def update
		@purchase = Purchase.find(params[:id])
		@purchase.update(cost: params[:cost], client: params[:client], product: params[:product], payment: params[:payment], password_digest: params[:password_digest], description: params[:description])

	end

	def delete
		@purchase = Purchase.find(params[:id])
		@purchase.destroy
		redirect_to action: "list"

	end
end
